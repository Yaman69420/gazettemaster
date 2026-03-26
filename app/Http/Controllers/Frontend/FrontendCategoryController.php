<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\View\View;

class FrontendCategoryController extends Controller
{
    public function show(Category $category): View
    {
        $posts = $category->posts()
            ->where('is_published', true)
            ->with(['media', 'categories', 'user'])
            ->latest('published_at')
            ->paginate(12);

        return view('frontend.categories.show', [
            'category' => $category,
            'posts' => $posts,
        ]);
    }
}
