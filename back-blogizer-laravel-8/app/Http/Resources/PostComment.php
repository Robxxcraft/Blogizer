<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PostComment extends JsonResource
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
            'body' => $this->body,
            'username' => $this->user->username,
            'userphoto' => $this->user->photo,
            'user_id' => $this->user->id,
            'created_at' => \Carbon\Carbon::parse($this->created_at)->locale('id')->translatedFormat('d F Y'),
        ];
    }
}
