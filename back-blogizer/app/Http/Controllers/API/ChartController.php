<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Post;
use App\Models\Comment;
use App\Models\Like;
use App\Models\Tag;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class ChartController extends Controller
{
    public function dashboard()
    {
        $posts = Post::count();
        $users = User::count();
        $tags = Tag::count();
        $counts = (object) [
            'posts' => $posts,
            'users' => $users,
            'tags' => $tags,
        ];
        return response()->json($counts, 200);
    }

    public function index(Post $post, Comment $comment, User $user)
    {
        $months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
        $post_count = [];
        $com_count = [];
        $usr_count = [];
        for($index=1; $index <= 12; $index++) { 
            $post_count[] = (int) $post->whereMonth('created_at', $index)->count();
            $com_count[] = (int) $comment->whereMonth('created_at', $index)->count();
            $usr_count[] = (int) $user->whereMonth('created_at', $index)->count();
        }
        $charts = (object) [
            'months' => $months,
            'posts' => $post_count,
            'comments' => $com_count,
            'users' => $usr_count,
        ];
        return response()->json($charts, 200);
    }

    public function userDashboard(Post $post, Like $like, Comment $comment)
    {
        $months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
        $mposts = [];
        $posts = $post->where('user_id', Auth::user()->id)->get();
        $likes = $post->where('user_id', Auth::user()->id)->withCount('like')->get();
        $comments = $post->where('user_id', Auth::user()->id)->withCount('comment')->get();
        for($index=1; $index <= 12; $index++) { 
            $mposts[] = (int) $post->where('user_id', Auth::user()->id)->whereMonth('created_at', $index)->count();
        }
        $charts = (object) [
            'months' => $months,
            'mposts' => $mposts,
            'posts' => $posts->count(),
            'likes' => $likes->sum('like_count'),
            'comments' => $comments->sum('comment_count')
        ];
        return response()->json($charts, 200);
    }
    
}