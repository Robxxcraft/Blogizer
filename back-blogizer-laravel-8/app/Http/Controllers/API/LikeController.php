<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Like;
use App\Models\Post;
use Illuminate\Support\Facades\Auth;

class LikeController extends Controller
{
    public function like($id)
    {
        Like::firstOrCreate([
            'user_id' => Auth::user()->id,
            'post_id' => $id,
        ]);
        return response()->json('Post liked', 201);
    }

    public function unlike($id)
    {
        $post = Like::where('user_id', Auth::user()->id)->where('post_id', $id);
        $post->delete();
        return response()->json('Post unliked', 200);
    }
}
