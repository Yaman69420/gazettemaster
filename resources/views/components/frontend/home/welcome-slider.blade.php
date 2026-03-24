@props([
    'featuredPosts' => collect(),
])

{{-- TODO: featured posts slider --}}
<section class="welcome-blog-post-slide owl-carousel">
    <div class="single-blog-post-slide bg-img background-overlay-5"
        style="background-image: url('{{ asset('frontend/gazette/img/blog-img/1.jpg') }}');">
        <div class="single-blog-post-content">
            <div class="tags">
                <a href="#">Placeholder</a>
            </div>
            <h3>
                <a href="#" class="font-pt">Coming soon</a>
            </h3>
            <div class="date">
                <a href="#">{{ now()->format('M d, Y') }}</a>
            </div>
        </div>
    </div>
</section>
