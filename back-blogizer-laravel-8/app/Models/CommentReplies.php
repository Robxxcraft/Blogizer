<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CommentReplies extends Model
{
    use HasFactory;

    protected $fillable = ['user_id', 'comment_id', 'body'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function replies()
    {
        return $this->hasMany(Comment::class, 'comment_id')->with('user');
    }
    public function likes()
    {
        return $this->hasMany(CommentLikes::class);
    }
}
