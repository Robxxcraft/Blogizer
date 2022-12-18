<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\AdminCategory;
use App\Http\Resources\HomeCategory;
use App\Http\Resources\ListPost;
use App\Models\Category;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;

class CategoryController extends Controller
{
    public function index(Request $request)
    {
        $categories = Category::when($request->has('search'), function($q)use($request){
            $q->where('name', 'like', '%'.$request->search.'%')->orWhere('id', (int)$request->search);
        })->latest()->simplePaginate(10);
        return AdminCategory::collection($categories);
    }

    public function categoryPosts(Request $request, $slug)
    {
        $posts = Post::whereHas('category', function($q)use($slug){ $q->where('slug', $slug); })->with(['user','category'])->whereMonth('created_at', '<=', $request->month)->whereYear('created_at', '<=',$request->year)->withCount('like')->orderBy('id', 'desc')->simplePaginate(8);
        return ListPost::collection($posts);
    }

    public function categoriesAll()
    {
        $categories = Category::has('post')->latest()->get();
        return response()->json($categories, 200);
    }

    public function categoriesLists()
    {
        $categories = Category::latest()->get();
        return response()->json($categories, 200);
    }

    public function home()
    {
        $categories = Category::has('post')->withCount('post')->orderBy('id', 'desc')->take(10)->get();
        return HomeCategory::collection($categories);
    }
 
    public function create(Request $request)
    {

        $request->validate([
            'name' => 'required|min:3|unique:categories,name'
        ]);

        Category::create([
            'name' => $request->name,
            'slug' => Str::slug($request->name)
        ]);
            
        return response()->json('Category added successfully', 201);
    }

    public function show($id)
    {
        $category = Category::findOrFail($id);

        return response()->json($category, 200);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|min:3|unique:categories,name,'.$id
        ]);

        $category = Category::findOrFail($id);

        $category->update([
            'name' => $request->name,
            'slug' => Str::slug($request->name)
        ]);

        return response()->json('Category updated successfully', 201);
    }

    public function destroy($id)
    {
        $category = Category::findOrFail($id);
        $category->delete();

        return response()->json('Category deleted sucessfullfy', 200);
    }

    public function deleteAll()
    {
        DB::table('categories')->delete();

        return response()->json('All Categories deleted', 200);
    }
    
}