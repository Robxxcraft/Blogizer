<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Role;
use App\Models\User;
use App\Models\UserDetail;
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Password;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $request->validate([
            'username' => 'required|min:3|max:60',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:8|max:30|confirmed',
            'password_confirmation' => 'required'
        ],
        [
            'username.required' => ':attribute should not be null',
            'email.required' => ':attribute should not be null',
            'password.required' => ':attribute should not be null',
            'password_confirmation.required' => ':attribute should not be null'
        ]);

        $user = User::create([
            'username' => ucwords(strtolower($request->username)),
            'email' => $request->email,
            'password' => Hash::make($request->password)
        ]);
        
        Role::create([
            'user_id' => $user->id,
            'name' => 'User'
        ]);

        // event(new Registered($user));

        return response()->json('Account Registered Successfully', 201);
    }

    public function emailVerification()
    {
        # code...
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
            'token' => 'required'
        ], 
        [
            'email.required' => ':attribute column should not be null',
            'password.required' => ':attribute column should not be null',
        ]);


        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            throw ValidationException::withMessages([
                'email' => 'The provided credentials are incorrect.',
            ]);
        }
        
        // if (!$user->hasVerifiedEmail()) {
        //     throw ValidationException::withMessages([
        //         'verify' => 'Email not verificated.',
        //     ])->status(403);
        // }

        return $user->createToken($request->token)->plainTextToken;
    }

    public function forgot(Request $request)
    {
        $request->validate(['email' => 'required|email']);
        $status = Password::sendResetLink($request->only('email'));
     
        return response()->json($status, 201);
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return;
    }

    public function update(Request $request)
    {
        $request->validate([
            'username' => 'required|min:3|unique:users,username,'.Auth::user()->id,
            'biodata' => 'max:200'
        ],
        [
            'biodata.max' => 'Biodata too long...'
        ]);

        $user = User::findOrFail(Auth::user()->id);

        $user->update([
            'username' => $request->username,
            'biodata' => $request->biodata
        ]);

        if ($request->hasFile('photo')) {
            if ($user->photo) {
                Cloudinary::destroy($user->created_at->format('Y-m-d').'_'.$user->id);
            }
            $uploadImg = Cloudinary::upload($request->file('photo')->getRealPath(), [
                'folder' =>  'blogizer',
                'public_id' => date('Y-m-d').'_'.$user->id,
                'transformation' => [
                    'width' => 200,
                    'heigth' => 200,
                ]
            ]);
            $user->photo = $uploadImg->getSecurePath();
            $user->save();
        }

        return response()->json('Profile Updated', 201);
    }

    public function reset(Request $request)
    {
        $request->validate([
            'token' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:8|confirmed',
        ]);

        $status = Password::reset(
            $request->only('email', 'password', 'password_confirmation', 'token'),
            function ($user) use ($request) {
                $user->forceFill([
                    'password' =>  Hash::make($request->password),
                    'remember_token' =>  Str::random(60),
                ])->save();

                event(new PasswordReset($user));
            }
        );

        if ($status == Password::PASSWORD_RESET) {
            return response('Password reset successfully', 201);
        }

        return response([
            'message' => __($status)
        ], 500);
    }

    public function changePassword(Request $request)
    {
        $request->validate([
            'current_password' => ['required'],
            'password' => ['required', 'min:8', 'confirmed'],
            'password_confirmation' => ['required'],
        ]);

        if (Hash::check($request->current_password, Auth::user()->password)) {
            $user = User::find(Auth::user()->id);
            $user->update(['password' => Hash::make($request->password)]);
            return response()->json('Your password has been updated', 201);
        }

        throw ValidationException::withMessages([
            'current_password' => 'Your current password does not match with our record'
        ]);
    }

    public function deleteAccount(Request $request)
    {
        # code...
    }
}
