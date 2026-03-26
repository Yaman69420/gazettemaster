<x-backend.shell title="Bericht bekijken - SB Admin">

    <x-slot:head>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </x-slot:head>

    <x-backend.page-header title="Bericht bekijken">

        <x-backend.card>
            <div class="card-header">
                <i class="fas fa-envelope-open me-1"></i>
                Bericht van {{ $message->name }}
            </div>

            <div class="card-body">
                <dl class="row mb-0">
                    <dt class="col-sm-2">Naam</dt>
                    <dd class="col-sm-10">{{ $message->name }}</dd>

                    <dt class="col-sm-2">E-mail</dt>
                    <dd class="col-sm-10">
                        <a href="mailto:{{ $message->email }}">{{ $message->email }}</a>
                    </dd>

                    <dt class="col-sm-2">Datum</dt>
                    <dd class="col-sm-10">{{ $message->created_at->format('d/m/Y H:i') }}</dd>

                    <dt class="col-sm-2">Bericht</dt>
                    <dd class="col-sm-10">
                        <p style="white-space: pre-wrap;">{{ $message->message }}</p>
                    </dd>
                </dl>
            </div>

            <div class="card-footer">
                <a href="{{ route('backend.contact-messages.index') }}" class="btn btn-secondary">
                    <i class="fas fa-arrow-left me-1"></i>
                    Terug naar overzicht
                </a>
            </div>
        </x-backend.card>

    </x-backend.page-header>

</x-backend.shell>
