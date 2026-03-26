@props([
    'latestPosts' => collect(),
])

<div class="latest-news-marquee-area">
    <div class="simple-marquee-container">
        <div class="marquee">
            <ul class="marquee-content-items">
                @forelse($latestPosts as $post)
                    <li>
                        <a href="{{ route('frontend.posts.show', $post) }}">
                            <span class="latest-news-time">
                                {{ optional($post->published_at)->format('H:i') ?? $post->created_at->format('H:i') }}
                            </span>
                            {{ $post->title }}
                        </a>
                    </li>
                @empty
                    <li><a href="#">Geen nieuws beschikbaar</a></li>
                @endforelse
            </ul>
        </div>
    </div>
</div>
