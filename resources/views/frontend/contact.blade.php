<x-frontend.shell title="Contact">
    <section class="single-post-contents section_padding_100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-7">

                    <h2 class="mb-3">Contact</h2>
                    <p class="mb-4" style="color: #888;">Vul het formulier in en we nemen zo snel mogelijk contact met je op.</p>

                    @if(session('status'))
                        <div style="background:#d4edda; color:#155724; border:1px solid #c3e6cb; padding:12px 16px; border-radius:4px; margin-bottom:20px;">
                            {{ session('status') }}
                        </div>
                    @endif

                    <form action="{{ route('contact.send') }}" method="POST">
                        @csrf

                        <div style="margin-bottom: 20px;">
                            <label style="display:block; font-weight:600; margin-bottom:6px;">Naam</label>
                            <input type="text" name="name" value="{{ old('name') }}"
                                style="width:100%; padding:10px 14px; border:1px solid {{ $errors->has('name') ? '#dc3545' : '#ddd' }}; border-radius:4px; font-size:15px;">
                            @error('name')
                                <span style="color:#dc3545; font-size:13px;">{{ $message }}</span>
                            @enderror
                        </div>

                        <div style="margin-bottom: 20px;">
                            <label style="display:block; font-weight:600; margin-bottom:6px;">E-mail</label>
                            <input type="email" name="email" value="{{ old('email') }}"
                                style="width:100%; padding:10px 14px; border:1px solid {{ $errors->has('email') ? '#dc3545' : '#ddd' }}; border-radius:4px; font-size:15px;">
                            @error('email')
                                <span style="color:#dc3545; font-size:13px;">{{ $message }}</span>
                            @enderror
                        </div>

                        <div style="margin-bottom: 20px;">
                            <label style="display:block; font-weight:600; margin-bottom:6px;">Bericht</label>
                            <textarea name="message" rows="6"
                                style="width:100%; padding:10px 14px; border:1px solid {{ $errors->has('message') ? '#dc3545' : '#ddd' }}; border-radius:4px; font-size:15px; resize:vertical;">{{ old('message') }}</textarea>
                            @error('message')
                                <span style="color:#dc3545; font-size:13px;">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="post-continue-btn">
                            <button type="submit">Verzenden</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </section>
</x-frontend.shell>
