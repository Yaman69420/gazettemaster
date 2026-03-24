@props(['post'])

<section class="single-post-contents section_padding_100">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-8">

                {{-- Categorieën --}}
                @if($post->categories->isNotEmpty())
                    <div class="mb-3">
                        @foreach($post->categories as $category)
                            <a href="{{ route('frontend.categories.show', $category) }}"
                               class="badge bg-primary text-decoration-none me-1">
                                {{ $category->name }}
                            </a>
                        @endforeach
                    </div>
                @endif

                {{-- Titel --}}
                <h1 class="mb-3">{{ $post->title }}</h1>

                {{-- Meta: auteur en datum --}}
                <div class="d-flex align-items-center gap-3 mb-4 text-muted">
                    @if($post->user)
                        <span>Door <strong>{{ $post->user->name }}</strong></span>
                    @endif
                    <span>
                        {{ optional($post->published_at)->format('d M Y') ?? $post->created_at->format('d M Y') }}
                    </span>
                </div>

                {{-- Afbeelding --}}
                @if($post->media)
                    <div class="mb-4">
                        <img src="{{ $post->media->url() }}"
                             alt="{{ $post->title }}"
                             class="img-fluid w-100">
                    </div>
                @endif

                {{-- Excerpt --}}
                @if($post->excerpt)
                    <p class="lead mb-4">{{ $post->excerpt }}</p>
                @endif

                {{-- Inhoud --}}
                <div class="post-body">
                    {!! nl2br(e($post->body)) !!}
                </div>

                {{-- Terug naar overzicht --}}
                <div class="mt-5">
                    <a href="{{ route('frontend.posts.index') }}" class="btn btn-outline-secondary">
                        &larr; Alle artikels
                    </a>
                </div>

            </div>
        </div>
    </div>
</section>
