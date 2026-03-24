@props([
    'sliderPosts' => collect(),
])

<section class="welcome-blog-post-slide owl-carousel">
    @forelse($sliderPosts as $post)
        @php
            $bgImage = $post->media
                ? $post->media->url()
                : asset('frontend/gazette/img/blog-img/1.jpg');
        @endphp

        <div class="single-blog-post-slide bg-img background-overlay-5"
            style="background-image: url('{{ $bgImage }}');">
            <div class="single-blog-post-content">
                <div class="tags">
                    @foreach($post->categories as $category)
                        <a href="{{ route('frontend.categories.show', $category) }}">{{ $category->name }}</a>
                    @endforeach
                </div>
                <h3>
                    <a href="{{ route('frontend.posts.show', $post) }}" class="font-pt">
                        {{ $post->title }}
                    </a>
                </h3>
                <div class="date">
                    <a href="{{ route('frontend.posts.show', $post) }}">
                        {{ optional($post->published_at)->format('M d, Y') ?? $post->created_at->format('M d, Y') }}
                    </a>
                </div>
            </div>
        </div>
    @empty
        <div class="single-blog-post-slide bg-img background-overlay-5"
            style="background-image: url('{{ asset('frontend/gazette/img/blog-img/1.jpg') }}');">
            <div class="single-blog-post-content">
                <h3 class="font-pt">Welkom bij de Gazette</h3>
            </div>
        </div>
    @endforelse
</section>
