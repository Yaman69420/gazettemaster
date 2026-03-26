<x-frontend.shell title="Alle artikels">
    <section class="main-content-wrapper section_padding_100">
        <div class="container">

            {{-- Zoekresultaten header --}}
            <div class="gazette-heading mb-50">
                @if($search)
                    <h4>Zoekresultaten voor: <em>"{{ $search }}"</em></h4>
                    <p class="gazette-post-date">{{ $posts->total() }} {{ $posts->total() === 1 ? 'artikel' : 'artikels' }} gevonden</p>
                @else
                    <h4>Alle artikels</h4>
                @endif
            </div>

            <div class="row">
                @forelse($posts as $post)
                    <div class="col-12 col-md-6 col-lg-4 mb-50">
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
                                    @if($post->user)
                                        · {{ $post->user->name }}
                                    @endif
                                </span>

                                @if($post->excerpt)
                                    <p>{{ Str::limit($post->excerpt, 120) }}</p>
                                @endif
                            </div>
                        </div>
                    </div>
                @empty
                    <div class="col-12">
                        <p class="gazette-post-date">
                            @if($search)
                                Geen artikels gevonden voor "{{ $search }}".
                            @else
                                Nog geen artikels beschikbaar.
                            @endif
                        </p>
                    </div>
                @endforelse
            </div>

            @if($posts->hasPages())
                <div class="d-flex justify-content-center mt-4">
                    {{ $posts->links() }}
                </div>
            @endif

        </div>
    </section>
</x-frontend.shell>
