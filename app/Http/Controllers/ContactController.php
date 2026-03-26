<?php

namespace App\Http\Controllers;

use App\Events\ContactMessageSent;
use App\Http\Requests\ContactFormRequest;
use App\Models\ContactMessage;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;

class ContactController extends Controller
{
    public function create(): View
    {
        return view('frontend.contact');
    }

    public function send(ContactFormRequest $request): RedirectResponse
    {
        $data = $request->validated();

        ContactMessage::create($data);

        ContactMessageSent::dispatch($data);

        return redirect()
            ->route('contact')
            ->with('status', 'Bericht succesvol verzonden.');
    }
}
