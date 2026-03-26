<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\ContactMessage;
use Illuminate\View\View;

class ContactMessageController extends Controller
{
    public function index(): View
    {
        $messages = ContactMessage::query()
            ->orderByDesc('created_at')
            ->paginate(20);

        return view('backend.contact-messages.index', [
            'messages' => $messages,
        ]);
    }

    public function show(ContactMessage $contactMessage): View
    {
        $contactMessage->update(['is_read' => true]);

        return view('backend.contact-messages.show', [
            'message' => $contactMessage,
        ]);
    }
}
