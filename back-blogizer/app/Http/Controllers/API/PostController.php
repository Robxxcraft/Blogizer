<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\AdminPost;
use App\Http\Resources\EditPost;
use App\Http\Resources\HomePost;
use App\Http\Resources\ListPost;
use App\Http\Resources\PostDetails;
use App\Models\Post;
use App\Models\Tag;
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PostController extends Controller
{
    public function index(Request $request){
        $posts = Post::with(['category','tag','user'])->withCount('like','comment')->latest()->when($request->has('search'), function($q)use($request){
            $q->where('title', 'like', '%'.$request->search.'%')->orWhereHas('category', function($q)use($request){ $q->where('name', 'like', '%'.$request->search.'%'); })->orWhereHas('tag', function($q)use($request){ $q->where('name', 'like', '%'.$request->search.'%'); })->orWhereHas('user', function($q)use($request){ $q->where('username', 'like', '%'.$request->search.'%'); })->orWhere('id', (int)$request->search); })->simplePaginate(10);
        return AdminPost::collection($posts);
    }

    public function recent(Request $request){
        // $posts = Post::with(['user','category'])->whereMonth('created_at', '<=', $request->month)->whereYear('created_at', '<=',$request->year)->withCount('like')->orderBy('id', 'desc')->simplePaginate(10);
        $limit = 10;
        if ($request->has('limit')) {
            $limit = $request->limit;
        }
        $posts = Post::with(['user','category'])->
                when(
                    $request->has('title'), function($q)use($request){
                        $q->orderBy("title", $request->title);
                    })->
                when(
                    $request->has('created_at'), function($q)use($request){
                        $q->orderBy("created_at", $request->created_at);
                    })->
                withCount('like')->orderBy('id', 'desc')->simplePaginate($limit);
                
        return ListPost::collection($posts);
    }

    public function related($slug){
        $postSlug = Post::where('slug', $slug)->with('category')->first()->category->slug;
        $posts = Post::whereNot('id',$postSlug->id)->whereHas('category', function($q)use($postSlug){
            $q->where('slug', $postSlug);
        })->with(['user','category'])->orderBy('id', 'desc')->take(5)->get();
        return HomePost::collection($posts);
    }

    public function popular(Request $request){
        $limit = 10;
        if ($request->has('limit')) {
            $limit = $request->limit;
        }
        $posts = Post::when(
            $request->has('title'), function($q)use($request){
                $q->orderBy("title", $request->title);
            })->
        when(
            $request->has('created_at'), function($q)use($request){
                $q->orderBy("created_at", $request->created_at);
            })->
        withCount(relations: 'like')->orderBy('like_count', 'desc')->with(['user','category'])->withCount('like')->orderBy('id', 'desc')->simplePaginate($limit);
        return ListPost::collection($posts);
    }

    public function homePopular(){
        $posts = Post::withCount('like')->orderBy('like_count', 'desc')->take(5)->get();
        return HomePost::collection($posts);
    }

    public function userPost(){
        $posts = Post::where('user_id', Auth::user()->id)->with(['user','category'])->withCount('like')->orderBy('id', 'desc')->simplePaginate(10);
        return ListPost::collection($posts);
    }

    public function userPopular(){
        $posts = Post::where('user_id', Auth::user()->id)->with(['user','category'])->withCount('like')->orderBy('like_count', 'desc')->orderBy('id', 'desc')->take(5)->get();
        return HomePost::collection($posts);
    }

    public function search(Request $request){
        $posts = Post::where('title', 'like', '%'.$request->search.'%')->orWhereHas('category', function($q)use($request){
            $q->where('name', 'like', '%'.$request->search.'%');
        })->with(['user','category'])->withCount('like')->orderBy('id', 'desc')->simplePaginate(10);
        return ListPost::collection($posts);
    }

    public function details($slug){
        $post = Post::where('slug', $slug)->with(['category','user','tag','comment' => function($q){
            $q->with('user');
        }])->withCount(['liked' => function($q){
            $q->where('user_id', auth('sanctum')->check() ? auth('sanctum')->user()->id : 0);
        }, 'like'])->first();
        return new PostDetails($post);
    }

    public function create(Request $request){
        $request->validate([
            'title' => 'required|min:5|max:200|unique:posts,title',
            'category' => 'required',
            'content' => 'required',
        ]);

        $post = Post::create([
            'title' => $request->title,
            'slug' => Str::slug($request->title),
            'category_id' => $request->category,
            'content' => $request->content,
            'user_id' => Auth::user()->id
        ]);
        if ($request->hasFile('photo')) {
            $uploadImg = Cloudinary::upload($request->file('photo')->getRealPath(), [
                'folder' =>  'blogizer',
                'public_id' => 'post-'.$post->created_at->format('Y-m-d').'_'.$post->id,
                'transformation' => [
                    'width' => 600,
                    'heigth' => 400,
                ]
            ]);
            $post->photo = $uploadImg->getSecurePath();
            $post->save();
        }
        $tags = json_decode($request->tags);
        if ($request->has('tags')) {
            foreach($tags as $tag){
                $tag = Tag::firstOrCreate([
                    'name' => strtolower($tag),
                    'slug' => Str::slug($tag)
                ]);

                $post->tag()->attach($tag->id);
            }
        }
        return response()->json('Post successfully created', 201);
    }

    public function edit($slug){
        $post = Post::where('slug', $slug)->with(['category','user','tag'])->first();
        return new EditPost($post);
    }

    public function update(Request $request, $id){
        $request->validate([
            'title' => 'required|min:5|max:200|unique:posts,title,'.$id,
            'category' => 'required',
            'content' => 'required',
        ]);

        $post = Post::find($id);
        $post->update([
            'title' => $request->title,
            'slug' => Str::slug($request->title),
            'category_id' => $request->category,
            'content' => $request->content,
            'user_id' => Auth::user()->id
        ]);
        if ($request->hasFile('photo')) {
            Cloudinary::destroy($post->created_at->format('Y-m-d').'_'.$post->id);
            $uploadImg = Cloudinary::upload($request->file('photo')->getRealPath(), [
                'folder' =>  'blogizer',
                'public_id' => $post->created_at->format('Y-m-d').'_'.$post->id,
                'transformation' => [
                    'width' => 600,
                    'heigth' => 400,
                ]
            ]);
            $post->photo = $uploadImg->getSecurePath();
            $post->save();
        }
        $tags = json_decode($request->tags);
        if ($request->has('tags')) {
            $post->tag()->detach();
            foreach($tags as $tag){
                $tag = Tag::firstOrCreate([
                    'name' => strtolower($tag),
                    'slug' => Str::slug($tag)
                ]);

                $post->tag()->attach($tag->id);
            }
        }
        return response()->json('Post successfully updated', 201);
    }

    public function destroy($id){
        $post = Post::find($id);
        if (isset($post->photo)) {
            Cloudinary::destroy('post-'.$post->created_at->format('Y-m-d').'_'.$post->id);
        }
        $post->delete();

        return response()->json('Post deleted successfully', 200);
    }

    public function destroyAll(){
        $posts = Post::all();
        
        foreach ($posts as $post) {
            if (isset($post->photo)) {
                Cloudinary::destroy('post-'.$post->created_at->format('Y-m-d').'_'.$post->id);
            }
        }

        $posts->truncate();

        return response()->json('Posts deleted successfully', 200);
    }
}
