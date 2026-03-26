@props([
    'videoPosts' => collect(),
])

<section class="gazatte-video-post-area section_padding_100_70 bg-gray">
    <div class="container">
        @forelse($videoPosts as $post)
            <div class="single-video-post mb-4">
                <h5><a href="{{ route('frontend.posts.show', $post) }}">{{ $post->title }}</a></h5>
            </div>
        @empty
            <p class="text-muted">Geen video posts beschikbaar.</p>
        @endforelse
    </div>
</section>
