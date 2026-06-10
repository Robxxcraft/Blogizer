<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Resources\AdminUser;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index(Request $request)
    {
        $users = User::when($request->has('search'), function($q)use($request){
            $q->where('username', 'like', '%'.$request->search.'%')->$q->orWhere('email', 'like', '%'.$request->search.'%')->$q->orWhere('biodata', 'like', '%'.$request->search.'%')->orWhere('id', (int)$request->search);
        })->with('role')->withCount('post')->latest()->simplePaginate(10);
        return AdminUser::collection($users);
    }
 
    public function show($id)
    {
        $user = User::findOrFail($id);
        return response()->json($user, 200);
    }

    public function destroy($id)
    {
        $user = User::findOrFail($id);
        $user->delete();

        return response()->json('User deleted sucessfullfy', 200);
    }
    
}