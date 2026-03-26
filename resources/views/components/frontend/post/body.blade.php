@props(['post'])

<section class="single-post-contents section_padding_100">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-8">

                {{-- Categorieën --}}
                @if($post->categories->isNotEmpty())
                    <div class="gazette-post-tag mb-3">
                        @foreach($post->categories as $category)
                            <a href="{{ route('frontend.categories.show', $category) }}">{{ $category->name }}</a>
                        @endforeach
                    </div>
                @endif

                {{-- Titel --}}
                <h1 class="font-pt mb-3">{{ $post->title }}</h1>

                {{-- Meta: auteur en datum --}}
                <span class="gazette-post-date mb-4 d-block">
                    @if($post->user)
                        Door <strong>{{ $post->user->name }}</strong> ·
                    @endif
                    {{ optional($post->published_at)->format('d M Y') ?? $post->created_at->format('d M Y') }}
                </span>

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
                    <p class="gazette-welcome-post mb-4" style="font-size: 18px; font-weight: 300;">{{ $post->excerpt }}</p>
                @endif

                {{-- Inhoud --}}
                <div class="post-body">
                    {!! nl2br(e($post->body)) !!}
                </div>

                {{-- Terug naar overzicht --}}
                <div class="mt-5">
                    <div class="post-continue-btn">
                        <a href="{{ route('frontend.posts.index') }}">
                            &larr; Alle artikels
                        </a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
