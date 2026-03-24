<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\View\View;

class FrontendPostController extends Controller
{
    public function index(Request $request): View
    {
        return view('frontend.posts.index', [
            'posts' => collect(),
            'search' => '',
        ]);
    }

    public function show(Post $post): View
    {
        return view('frontend.posts.show', [
            'post' => $post,
        ]);
    }
}
