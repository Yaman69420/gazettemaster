<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\View\View;

class FrontendCategoryController extends Controller
{
    public function show(Category $category): View
    {
        return view('frontend.categories.show', [
            'category' => $category,
            'posts' => collect(),
        ]);
    }
}
