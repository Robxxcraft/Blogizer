<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use App\Http\Controllers\Controller;
use Illuminate\Auth\Events\Verified;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class VerifyController extends Controller
{
    public function verify(Request $request): RedirectResponse 
    {
        $user = User::findOrFail($request->id);
        if ($user->hasVerifiedEmail()) {
            return redirect(env('FRONT_APP'). '/login');
        } else {
            $user->markEmailAsVerified();
            event(new Verified($user));
        }
        return redirect(env('FRONT_APP'). '/login?verified=true');
    }
    public function resend(Request $request){
        $user = User::where('email', $request->email)->first();
        $user->sendEmailVerificationNotification();
        return response()->json(['VerifySended' => 'Check your email to verify account']);
    }
}
