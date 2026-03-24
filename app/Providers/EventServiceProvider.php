<?php

namespace App\Providers;

use App\Events\ContactMessageSent;
use App\Events\PostCreated;
use App\Events\PostUpdated;
use App\Listeners\LogPostCreated;
use App\Listeners\LogPostUpdated;
use App\Listeners\SendContactMessageMail;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event to listener mappings for the application.
     *
     * @var array<class-string, array<int, class-string>>
     */
    protected $listen = [
        ContactMessageSent::class => [
            SendContactMessageMail::class,
        ],
        PostCreated::class => [
            LogPostCreated::class,
        ],
        PostUpdated::class => [
            LogPostUpdated::class,
        ],
    ];

    /**
     * Register any events for your application.
     */
    public function boot(): void
    {
        //
    }

    /**
     * Determine if events and listeners should be automatically discovered.
     */
    public function shouldDiscoverEvents(): bool
    {
        return false;
    }
}
