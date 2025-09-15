<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\CommentLikes;
use Illuminate\Support\Facades\Auth;

class LikeCommentController extends Controller
{
    public function like($id)
    {
        CommentLikes::firstOrCreate([
            'user_id' => Auth::user()->id,
            'comment_id' => $id,
        ]);
        return response()->json(null, 201);
    }

    public function unlike($id)
    {
        $comment = CommentLikes::where('user_id', Auth::user()->id)->where('comment_id', $id);
        $comment->delete();
        return response()->json(null, 200);
    }
}
