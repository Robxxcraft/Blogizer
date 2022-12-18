<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class HomePost extends JsonResource
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
            'slug' => $this->slug,
            'photo' => $this->photo,
            'created_at' => \Carbon\Carbon::parse($this->created_at)->locale('id')->translatedFormat('d F Y'),
        ];;
    }
}