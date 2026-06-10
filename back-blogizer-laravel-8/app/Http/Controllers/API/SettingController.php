<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Setting;
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;
use Illuminate\Http\Request;

class SettingController extends Controller
{
    public function index()
    {
        $banners = Setting::orderBy('type', 'asc')->get();
        return response()->json($banners,200);
    }
    public function change(Request $request)
    {
        $banner1 = Setting::where('type', 'banner1')->first();
        if (!$banner1) {
            $banner1 = Setting::create([
                'type' => 'banner1',
            ]);
        }
        $banner2 = Setting::where('type', 'banner2')->first();
        if (!$banner2) {
            $banner2 = Setting::create([
                'type' => 'banner2',
            ]);
        }
        $banner3 = Setting::where('type', 'banner3')->first();
        if (!$banner3) {
            $banner3 = Setting::create([
                'type' => 'banner3',
            ]);
        }
            if ($request->hasFile('banner1')) {
                if (isset($banner1->content)) {
                    Cloudinary::destroy('banner1-'.$banner1->created_at->format('Y-m-d').'_'.$banner1->id);
                }
                $banner1Img = cloudinary()->upload($request->file('banner1')->getRealPath(), [
                    'folder' => 'blogizer',
                    'public_id' => 'banner-1_'.$banner1->created_at->format('Y-m-d').'_'.$banner1->id,
                    'transformation' => [
                        'width' => 900,
                        'height' => 475,
                        'crop' => 'fill'
                    ]
                ])->getSecurePath();
                $banner1->content = $banner1Img;
                $banner1->save();
            }

            if ($request->hasFile('banner2')) {
                if (isset($banner2->content)) {
                    Cloudinary::destroy('banner2-'.$banner2->created_at->format('Y-m-d').'_'.$banner2->id);
                }
                $banner2Img = cloudinary()->upload($request->file('banner2')->getRealPath(), [
                    'folder' => 'blogizer',
                    'public_id' => 'banner-2_'.$banner2->created_at->format('Y-m-d').'_'.$banner2->id,
                    'transformation' => [
                        'width' => 900,
                        'height' => 475,
                        'crop' => 'fill'
                    ]
                ])->getSecurePath();
                $banner2->content = $banner2Img;
                $banner2->save();
            }

            if ($request->hasFile('banner3')) {
                if (isset($banner3->content)) {
                    Cloudinary::destroy('banner3-'.$banner3->created_at->format('Y-m-d').'_'.$banner3->id);
                }
                $banner3Img = cloudinary()->upload($request->file('banner3')->getRealPath(), [
                    'folder' => 'blogizer',
                    'public_id' => 'banner-3_'.$banner3->created_at->format('Y-m-d').'_'.$banner3->id,
                    'transformation' => [
                        'width' => 900,
                        'height' => 475,
                        'crop' => 'fill'
                    ]
                ])->getSecurePath();
                $banner3->content = $banner3Img;
                $banner3->save();
            }

        return response()->json("Banner changed", 201);
    }
}