<?php

use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\Frontend\FrontendCategoryController;
use App\Http\Controllers\Frontend\FrontendPostController;
use App\Http\Controllers\Frontend\HomeController;
use App\Http\Controllers\MediaController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Frontend Routes
|--------------------------------------------------------------------------
*/
Route::get('/', [HomeController::class, 'index'])->name('home');
Route::view('/about', 'frontend.about')->name('about');
Route::view('/contact', 'frontend.contact')->name('contact');
Route::post('/contact', [ContactController::class, 'send'])->name('contact.send');

// Publieke posts-overzicht en zoekfunctie
Route::get('/posts', [FrontendPostController::class, 'index'])->name('frontend.posts.index');

// Detailpagina van één post
Route::get('/posts/{post:slug}', [FrontendPostController::class, 'show'])->name('frontend.posts.show');

// Categoriepagina
Route::get('/categories/{category:slug}', [FrontendCategoryController::class, 'show'])->name('frontend.categories.show');

/*
|--------------------------------------------------------------------------
| Backend Routes (Protected by Auth)
|--------------------------------------------------------------------------
*/
Route::middleware([
    'auth:web',
    config('fortify.auth_middleware', 'auth'),
    'verified',
])->prefix('backend')->name('backend.')->group(function () {

    // Dashboard
    Route::view('/dashboard', 'backend.dashboard')->name('dashboard');

    // Posts (incl. Soft Deletes)
    Route::post('posts/{id}/restore', [PostController::class, 'restore'])->name('posts.restore');
    Route::delete('posts/{id}/force-delete', [PostController::class, 'forceDelete'])->name('posts.force-delete');
    Route::resource('posts', PostController::class);

    // Categories
    Route::resource('categories', CategoryController::class)->except(['show']);

    // Media
    Route::resource('media', MediaController::class)->only(['index', 'store', 'destroy']);

    // Users & Roles (Admin/Editor only)
    Route::resource('users', UserController::class);
    Route::resource('roles', RoleController::class);
});

// Settings & Profile
require __DIR__.'/settings.php';
