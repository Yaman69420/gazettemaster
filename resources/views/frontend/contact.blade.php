<x-frontend.shell title="Contact">
    <div class="container" style="padding: 60px 15px;">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <h1 class="mb-4">Contact</h1>
                <p class="lead mb-4">Vul het formulier in en we nemen zo snel mogelijk contact met je op.</p>

                @if(session('status'))
                    <div class="alert alert-success">{{ session('status') }}</div>
                @endif

                <form action="{{ route('contact.send') }}" method="POST">
                    @csrf

                    <div class="mb-3">
                        <label for="name" class="form-label">Naam</label>
                        <input type="text" name="name" id="name" value="{{ old('name') }}" class="form-control @error('name') is-invalid @enderror">
                        @error('name')<div class="invalid-feedback">{{ $message }}</div>@enderror
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">E-mail</label>
                        <input type="email" name="email" id="email" value="{{ old('email') }}" class="form-control @error('email') is-invalid @enderror">
                        @error('email')<div class="invalid-feedback">{{ $message }}</div>@enderror
                    </div>

                    <div class="mb-3">
                        <label for="message" class="form-label">Bericht</label>
                        <textarea name="message" id="message" rows="6" class="form-control @error('message') is-invalid @enderror">{{ old('message') }}</textarea>
                        @error('message')<div class="invalid-feedback">{{ $message }}</div>@enderror
                    </div>

                    <button type="submit" class="btn btn-primary">Verzenden</button>
                </form>
            </div>
        </div>
    </div>
</x-frontend.shell>
