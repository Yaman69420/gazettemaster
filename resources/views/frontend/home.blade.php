<x-frontend.shell title="Home">
    <x-frontend.home.welcome-slider :sliderPosts="$sliderPosts" />
    <x-frontend.home.latest-news-marquee :latestPosts="$latestPosts" />
    <x-frontend.home.main-content :latestPosts="$latestPosts" :categories="$categories" />
    <x-frontend.home.video-post-area />
</x-frontend.shell>
