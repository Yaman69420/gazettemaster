@props([
    'latestPosts' => collect(),
])

<div class="latest-news-marquee-area">
    <div class="simple-marquee-container">
        <div class="marquee">
            <ul class="marquee-content-items">
                <li>
                    <a href="#">
                        <span class="latest-news-time">{{ now()->format('H:i') }}</span>
                        Nieuws item placeholder
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="latest-news-time">{{ now()->format('H:i') }}</span>
                        Nog een nieuws item
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
