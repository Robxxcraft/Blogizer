<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Comment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CommentController extends Controller
{
    public function create(Request $request, $id)
    {
        $request->validate([
            'body' => 'required|min:3|max:500'
        ],
        [
            'body.min' => "Comment too shorted...",
            'body.max' => "Comment too long!"
        ]);

        $comment = Comment::create([
            'body' => $request->body,
            'user_id' => Auth::user()->id,
            'post_id' => $id,
        ]);
            
        return response()->json($comment->id, 201);
    }

    // public function update($request, $id)
    // {
    //     $request->validate([
    //         'body' => 'required|min:3|max:500'
    //     ],
    //     [
    //         'body.min' => "Comment too shorted..."
    //     ]);
    //     $comment = Comment::findOrFail($id);
    //     $comment->update([
    //         'body' => $request->body,
    //     ]);

    //     return response()->json('Comment edited', 200);
    // }

    public function delete($id)
    {
        $comment = Comment::findOrFail($id);
        $comment->delete();
        return response()->json('Comment deleted', 200);
    }
}