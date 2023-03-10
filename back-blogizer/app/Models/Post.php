<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;

    protected $fillable = ['title', 'slug', 'category_id', 'content', 'photo', 'user_id'];

    protected $casts = [
        'liked_count' => 'boolean'
    ];

    public function liked(){
        return $this->hasOne(Like::class);
    }

    public function category(){
        return $this->belongsTo(Category::class);
    }

    public function tag(){
        return $this->belongsToMany(Tag::class);
    }

    public function like(){
        return $this->hasMany(Like::class);
    }

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function comment(){
        return $this->hasMany(Comment::class);
    }
}
