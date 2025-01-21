<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\AdminTag;
use App\Http\Resources\HomeTag;
use App\Http\Resources\ListPost;
use App\Models\Post;
use App\Models\Tag;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class TagController extends Controller
{
    public function index()
    {
        $tags = Tag::withCount('post')->latest()->simplePaginate(10);
        return AdminTag::collection($tags);
    }

    public function home()
    {
        $tags = Tag::has('post')->withCount('post')->orderBy('post_count')->take(10)->get();
        return HomeTag::collection($tags);
    }

    public function tagPosts(Request $request, $slug)
    {
        $posts = Post::whereHas('tag', function($q)use($slug){
            $q->where('slug', $slug);
        })->with(['user','category'])->withCount('like')->orderBy('id', 'desc')->simplePaginate(10);
        return ListPost::collection($posts);
    }

    public function show($id)
    {
        $tag = Tag::findOrFail($id);

        return response()->json($tag, 200);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|min:3|unique:categories,name,'.$id
        ]);

        $tag = Tag::findOrFail($id);

        $tag->update([
            'name' => $request->name,
            'slug' => Str::slug($request->name)
        ]);

        return response()->json('Tag updated successfully', 201);
    }

    public function destroy($id)
    {
        $tag = Tag::findOrFail($id);
        $tag->delete();

        return response()->json('Tag deleted sucessfullfy', 200);
    }
}
