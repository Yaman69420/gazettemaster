@props([
    'latestPosts' => collect(),
])

<section class="main-content-wrapper section_padding_100">
    <div class="container">
        <div class="row">

            @forelse($latestPosts as $post)
                <div class="col-12 col-md-6 col-lg-4 mb-4">
                    <div class="single-blog-post">

                        @if($post->media)
                            <div class="blog-thumbnail">
                                <a href="{{ route('frontend.posts.show', $post) }}">
                                    <img src="{{ $post->media->url() }}" alt="{{ $post->title }}" class="img-fluid">
                                </a>
                            </div>
                        @endif

                        <div class="blog-content">
                            <div class="post-meta d-flex align-items-center mb-2">
                                @foreach($post->categories as $category)
                                    <a href="{{ route('frontend.categories.show', $category) }}">{{ $category->name }}</a>{{ !$loop->last ? ' · ' : '' }}
                                @endforeach
                                <span style="margin-left: auto;">
                                    {{ optional($post->published_at)->format('M d, Y') ?? $post->created_at->format('M d, Y') }}
                                </span>
                            </div>

                            <h5>
                                <a href="{{ route('frontend.posts.show', $post) }}">{{ $post->title }}</a>
                            </h5>

                            @if($post->excerpt)
                                <p>{{ Str::limit($post->excerpt, 100) }}</p>
                            @endif
                        </div>
                    </div>
                </div>
            @empty
                <div class="col-12">
                    <p class="text-muted">Nog geen artikels beschikbaar.</p>
                </div>
            @endforelse

        </div>

        <div class="text-center mt-4">
            <a href="{{ route('frontend.posts.index') }}" class="btn btn-primary">
                Alle artikels bekijken
            </a>
        </div>
    </div>
</section>
