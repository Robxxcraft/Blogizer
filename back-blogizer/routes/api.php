<?php

use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\VerifyController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\CategoryController;
use App\Http\Controllers\API\CommentController;
use App\Http\Controllers\API\PostController;
use App\Http\Controllers\API\LikeController;
use App\Http\Controllers\API\SettingController;
use App\Http\Controllers\API\TagController;
use App\Http\Controllers\API\ChartController;
use App\Http\Controllers\API\UserController;
use App\Http\Middleware\isAdmin;
use App\Http\Resources\UserResource;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return new UserResource(auth()->user()->load('role'));
});

Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);

Route::get('/email/verify', [VerifyController::class, 'verify'])->middleware(['throttle:6,1'])->name('verification.verify');
Route::get('/email/verify/resend', [VerifyController::class, 'resend'])->middleware(['throttle:6,1'])->name('verification.send');
Route::post('/forgot/send', [AuthController::class, 'forgot']);

Route::middleware('auth:sanctum')->group(function(){
    Route::middleware(isAdmin::class)->group(function(){
        Route::post('/setting/banner', [SettingController::class, 'change']);
        
        Route::get('/categories', [CategoryController::class, 'index']);
        Route::post('/categories', [CategoryController::class, 'create']);
        Route::get('/categories/{id}', [CategoryController::class, 'show']);
        Route::post('/categories/{id}', [CategoryController::class, 'update']);
        Route::delete('/categories/{id}', [CategoryController::class, 'destroy']);
        Route::delete('/categories', [CategoryController::class, 'destroyAll']);

        Route::get('/posts', [PostController::class, 'index']);
        Route::delete('/posts', [PostController::class, 'destroyAll']);

        Route::get('/tags', [TagController::class, 'index']);
        Route::get('/tags/{id}', [TagController::class, 'show']);
        Route::post('/tags/{id}', [TagController::class, 'update']);
        Route::delete('/tags/{id}', [TagController::class, 'destroy']);
        Route::delete('/tags', [TagController::class, 'destroyAll']);
        
        Route::get('/users', [UserController::class, 'index']);
        Route::get('/users/update/admin', [UserController::class, 'index']);
        Route::get('/users/{id}', [UserController::class, 'show']);
        Route::delete('/users/{id}', [UserController::class, 'destroy']);

        Route::get('/dashboard', [ChartController::class, 'dashboard']);
        Route::get('/chart', [ChartController::class, 'index']);

    });
    
    Route::get('/logout', [AuthController::class, 'logout']);
    Route::post('/posts', [PostController::class, 'create']);
    Route::post('/posts/{id}/edit', [PostController::class, 'update']);
    Route::delete('/posts/{id}', [PostController::class, 'destroy']);

    Route::get('/lists/posts/user', [PostController::class, 'userPost']);
    Route::get('/user/posts/popular', [PostController::class, 'userPopular']);

    Route::post('/post/{id}/comment', [CommentController::class, 'create']);
    Route::delete('/post/{id}/comment', [CommentController::class, 'delete']);

    Route::post('/posts/{id}/like', [LikeController::class, 'like']);
    Route::post('/posts/{id}/unlike', [LikeController::class, 'unlike']);

    Route::get('/user/dashboard', [ChartController::class, 'userDashboard']);
    Route::post('/profile/update', [AuthController::class, 'update']);
});

Route::get('/all/categories', [CategoryController::class, 'categoriesAll']);
Route::get('/lists/categories', [CategoryController::class, 'categoriesLists']);

Route::get('/home/categories', [CategoryController::class, 'home']);
Route::get('/home/posts/popular', [PostController::class, 'homePopular']);
Route::get('/home/tags', [TagController::class, 'home']);

Route::get('/lists/posts/postscategory/{slug}', [CategoryController::class, 'categoryPosts']);
Route::get('/lists/posts/recent', [PostController::class, 'recent']);
Route::get('/lists/posts/popular', [PostController::class, 'popular']);
Route::get('/lists/posts/search/{slug}', [PostController::class, 'search']);
Route::get('/lists/posts/tag/{slug}', [TagController::class, 'tagPosts']);

Route::get('/posts/related/{slug}', [PostController::class, 'related']);
Route::get('/posts/{slug}/edit', [PostController::class, 'edit']);
Route::get('/posts/{slug}/details', [PostController::class, 'details']);

Route::get('/setting/banner', [SettingController::class, 'index']);