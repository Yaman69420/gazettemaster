<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Post;
use Illuminate\View\View;

class HomeController extends Controller
{
    public function index(): View
    {
        $featuredPosts = Post::query()
            ->where('is_published', true)
            ->featured()
            ->with(['media', 'categories'])
            ->latest('published_at')
            ->limit(5)
            ->get();

        if ($featuredPosts->count() < 5) {
            $extraPosts = Post::query()
                ->where('is_published', true)
                ->where('is_featured', false)
                ->with(['media', 'categories'])
                ->latest('published_at')
                ->limit(5 - $featuredPosts->count())
                ->get();

            $featuredPosts = $featuredPosts->merge($extraPosts);
        }

        $latestPosts = Post::query()
            ->where('is_published', true)
            ->with(['media', 'categories'])
            ->latest('published_at')
            ->limit(10)
            ->get();

        $categories = Category::query()
            ->withCount(['posts' => fn ($q) => $q->where('is_published', true)])
            ->having('posts_count', '>', 0)
            ->orderByDesc('posts_count')
            ->get();

        return view('frontend.home', [
            'sliderPosts' => $featuredPosts,
            'latestPosts' => $latestPosts,
            'categories' => $categories,
        ]);
    }
}
