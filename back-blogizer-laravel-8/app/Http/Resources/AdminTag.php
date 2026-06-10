<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class AdminTag extends JsonResource
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
            'name' => $this->name,
            'slug' => $this->slug,
            'posts' => $this->post_count,
            'created_at' => \Carbon\Carbon::parse($this->created_at)->locale('id')->translatedFormat('d F Y')
        ];
    }
}
