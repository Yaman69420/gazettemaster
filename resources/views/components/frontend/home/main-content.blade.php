@props([
    'latestPosts' => collect(),
    'categories' => collect(),
])

@php
    $headlinePost = $latestPosts->first();
    $gridPosts = $latestPosts->skip(1)->values();
@endphp

<section class="main-content-wrapper section_padding_100">
    <div class="container">
        <div class="row">

            {{-- Linker kolom: posts --}}
            <div class="col-12 col-lg-8">

                {{-- Headline post --}}
                @if($headlinePost)
                    <div class="gazette-welcome-post mb-5">

                        @if($headlinePost->media)
                            <div class="blog-post-thumbnail mb-30">
                                <a href="{{ route('frontend.posts.show', $headlinePost) }}">
                                    <img src="{{ $headlinePost->media->url() }}" alt="{{ $headlinePost->title }}"
                                         class="img-fluid w-100" style="max-height: 340px; object-fit: cover;">
                                </a>
                            </div>
                        @endif

                        <div class="welcome-post-contents">
                            <div class="gazette-post-tag">
                                @foreach($headlinePost->categories as $category)
                                    <a href="{{ route('frontend.categories.show', $category) }}">{{ $category->name }}</a>
                                @endforeach
                            </div>

                            <h2>
                                <a href="{{ route('frontend.posts.show', $headlinePost) }}" class="font-pt">
                                    {{ $headlinePost->title }}
                                </a>
                            </h2>

                            <span class="gazette-post-date">
                                {{ optional($headlinePost->published_at)->format('M d, Y') ?? $headlinePost->created_at->format('M d, Y') }}
                            </span>

                            @if($headlinePost->excerpt)
                                <p class="mt-3">{{ $headlinePost->excerpt }}</p>
                            @endif
                        </div>
                    </div>

                    <hr class="mb-50">
                @endif

                {{-- Grid van overige posts (2 kolommen) --}}
                <div class="row">
                    @foreach($gridPosts as $post)
                        <div class="col-12 col-md-6 mb-50">
                            <div class="gazette-welcome-post">

                                @if($post->media)
                                    <div class="blog-post-thumbnail mb-30">
                                        <a href="{{ route('frontend.posts.show', $post) }}">
                                            <img src="{{ $post->media->url() }}" alt="{{ $post->title }}"
                                                 class="img-fluid w-100" style="max-height: 200px; object-fit: cover;">
                                        </a>
                                    </div>
                                @endif

                                <div class="welcome-post-contents">
                                    <div class="gazette-post-tag">
                                        @foreach($post->categories as $category)
                                            <a href="{{ route('frontend.categories.show', $category) }}">{{ $category->name }}</a>
                                        @endforeach
                                    </div>

                                    <h5>
                                        <a href="{{ route('frontend.posts.show', $post) }}">{{ $post->title }}</a>
                                    </h5>

                                    <span class="gazette-post-date">
                                        {{ optional($post->published_at)->format('M d, Y') ?? $post->created_at->format('M d, Y') }}
                                    </span>

                                    @if($post->excerpt)
                                        <p>{{ Str::limit($post->excerpt, 100) }}</p>
                                    @endif
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>

                <div class="text-center mt-3">
                    <a href="{{ route('frontend.posts.index') }}" class="btn gazette-btn">
                        Alle artikels bekijken
                    </a>
                </div>
            </div>

            {{-- Rechter sidebar --}}
            <div class="col-12 col-lg-4">

                {{-- Categorieën --}}
                <div class="sidebar-widget-area mb-50">
                    <div class="widget-title">
                        <h5>Categories</h5>
                    </div>
                    <ul class="list-unstyled">
                        @foreach($categories as $category)
                            <li class="mb-2">
                                <a href="{{ route('frontend.categories.show', $category) }}" style="color: #333; font-size: 14px;">
                                    {{ $category->name }}
                                    <span style="color: #aaa;">({{ $category->posts_count }})</span>
                                </a>
                            </li>
                        @endforeach
                    </ul>
                </div>

                {{-- Advertentie --}}
                <div class="sidebar-widget-area">
                    <div class="widget-title">
                        <h5>Advert</h5>
                    </div>
                    <div class="mt-3">
                        <a href="{{ route('contact') }}">
                            <img src="{{ asset('frontend/gazette/img/bg-img/add.png') }}"
                                 alt="advertentie" class="img-fluid w-100">
                        </a>
                    </div>
                </div>

            </div>

        </div>
    </div>
</section>
