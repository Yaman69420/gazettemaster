<x-backend.shell title="Berichten - SB Admin">

    <x-slot:head>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </x-slot:head>

    <x-backend.page-header title="Contactberichten">

        <x-backend.card>
            <div class="card-header">
                <i class="fas fa-envelope me-1"></i>
                Berichten
                <span class="text-muted ms-2">({{ $messages->total() }} totaal)</span>
            </div>

            <div class="table-responsive">
                <table class="table table-bordered table-striped mb-0">
                    <thead>
                    <tr>
                        <th style="width: 40px;"></th>
                        <th>Naam</th>
                        <th>E-mail</th>
                        <th>Bericht</th>
                        <th>Datum</th>
                        <th class="text-end">Actie</th>
                    </tr>
                    </thead>

                    <tbody>
                    @forelse($messages as $message)
                        <tr class="{{ $message->is_read ? '' : 'fw-bold' }}">
                            <td class="text-center">
                                @if(! $message->is_read)
                                    <span class="badge bg-primary">Nieuw</span>
                                @endif
                            </td>
                            <td>{{ $message->name }}</td>
                            <td>{{ $message->email }}</td>
                            <td>{{ Str::limit($message->message, 80) }}</td>
                            <td>{{ $message->created_at->format('d/m/Y H:i') }}</td>
                            <td class="text-end">
                                <a href="{{ route('backend.contact-messages.show', $message) }}"
                                   class="btn btn-sm btn-outline-primary">
                                    Bekijken
                                </a>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="6" class="text-center text-muted py-4">
                                Geen berichten gevonden.
                            </td>
                        </tr>
                    @endforelse
                    </tbody>
                </table>
            </div>

            <div class="d-flex align-items-center justify-content-between mt-3">
                <div class="small text-muted">
                    Showing {{ $messages->firstItem() ?? 0 }} to {{ $messages->lastItem() ?? 0 }} of {{ $messages->total() }}
                </div>
                <div>
                    {{ $messages->links() }}
                </div>
            </div>
        </x-backend.card>

    </x-backend.page-header>

</x-backend.shell>
