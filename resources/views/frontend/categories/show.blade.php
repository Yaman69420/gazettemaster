<x-frontend.shell :title="$category->name">
    <section class="main-content-wrapper section_padding_100">
        <div class="container">

            {{-- Categorie header --}}
            <div class="mb-4">
                <h4>{{ $category->name }}</h4>

                @if($category->description)
                    <p class="text-muted">{{ $category->description }}</p>
                @endif

                <p class="text-muted">{{ $posts->total() }} {{ $posts->total() === 1 ? 'artikel' : 'artikels' }}</p>
            </div>

            <div class="row">
                @forelse($posts as $post)
                    <div class="col-12 col-md-6 col-lg-4 mb-4">
                        <div class="single-blog-post">

                            @if($post->media)
                                <div class="blog-thumbnail mb-2">
                                    <a href="{{ route('frontend.posts.show', $post) }}">
                                        <img src="{{ $post->media->url() }}" alt="{{ $post->title }}" class="img-fluid">
                                    </a>
                                </div>
                            @endif

                            <div class="blog-content">
                                <div class="post-meta d-flex align-items-center mb-2">
                                    @foreach($post->categories as $cat)
                                        <a href="{{ route('frontend.categories.show', $cat) }}" class="me-2">
                                            {{ $cat->name }}
                                        </a>
                                    @endforeach
                                    <span class="text-muted ms-auto">
                                        {{ optional($post->published_at)->format('M d, Y') ?? $post->created_at->format('M d, Y') }}
                                    </span>
                                </div>

                                <h5>
                                    <a href="{{ route('frontend.posts.show', $post) }}">{{ $post->title }}</a>
                                </h5>

                                @if($post->excerpt)
                                    <p class="text-muted">{{ Str::limit($post->excerpt, 120) }}</p>
                                @endif

                                @if($post->user)
                                    <small class="text-muted">Door {{ $post->user->name }}</small>
                                @endif
                            </div>
                        </div>
                    </div>
                @empty
                    <div class="col-12">
                        <p class="text-muted">Geen gepubliceerde artikels in deze categorie.</p>
                    </div>
                @endforelse
            </div>

            {{-- Paginatie --}}
            @if($posts->hasPages())
                <div class="d-flex justify-content-center mt-4">
                    {{ $posts->links() }}
                </div>
            @endif

        </div>
    </section>
</x-frontend.shell>
