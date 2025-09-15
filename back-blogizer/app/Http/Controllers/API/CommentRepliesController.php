<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\CommentReplies;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CommentRepliesController extends Controller
{
    public function create(Request $request, $id)
    {
        $request->validate([
            'body' => 'required|min:3|max:500'
        ],
        [
            'body.min' => "Reply too shorted...",
            'body.max' => "Reply too long!"
        ]);

        $reply = CommentReplies::create([
            'body' => $request->body,
            'user_id' => Auth::user()->id,
            'comment_id' => $id,
        ]);
            
        return response()->json($reply->id, 201);
    }

    // public function update($request, $id)
    // {
    //     $request->validate([
    //         'body' => 'required|min:3|max:500'
    //     ],
    //     [
    //         'body.min' => "Reply too shorted..."
    //     ]);
    //     $comment = CommentReplies::findOrFail($id);
    //     $comment->update([
    //         'body' => $request->body,
    //     ]);

    //     return response()->json('Reply updated', 200);
    // }

    public function delete($id)
    {
        $reply = CommentReplies::findOrFail($id);
        $reply->delete();
        return response()->json('Reply deleted', 200);
    }
}