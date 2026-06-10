<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PostDetails extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'content' => $this->content,
            'slug' => $this->slug,
            'category' => $this->category->name,
            'category_slug' => $this->category->slug,
            'username' => $this->user->username,
            'userphoto' => $this->user->photo,
            'photo' => $this->photo,
            'tags' => $this->tag,
            'likes' => $this->like_count,
            'liked' => $this->liked_count,
            'comments' => PostComment::collection($this->comment),
            'created_at' => \Carbon\Carbon::parse($this->created_at)->locale('id')->translatedFormat('d F Y')
        ];
    }
}
