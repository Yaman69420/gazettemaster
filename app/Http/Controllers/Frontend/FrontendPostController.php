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
        $search = $request->string('q')->trim()->toString();

        $posts = Post::query()
            ->where('is_published', true)
            ->search($search)
            ->with(['media', 'categories', 'user'])
            ->latest('published_at')
            ->paginate(12)
            ->withQueryString();

        return view('frontend.posts.index', [
            'posts' => $posts,
            'search' => $search,
        ]);
    }

    public function show(Post $post): View
    {
        abort_if(! $post->is_published, 404);

        $post->load(['media', 'categories', 'user']);

        return view('frontend.posts.show', [
            'post' => $post,
        ]);
    }
}
