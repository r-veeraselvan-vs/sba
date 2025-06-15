@extends('layouts.app')

@section('content')

<div style="margin-top:1rem">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>Create Subheading</h4>
                  </div>
        <div class="panel-body">
        <form method="POST" action="{{ route('subheading.store') }}">
            @csrf

            <div class="form-group">
                <label for="heading_id">Heading</label>
                <select name="heading_id" id="heading_id" class="form-control" required>
                    <option value="">Select a Heading</option>
                    @foreach ($headings as $heading)
                        @if($heading->status == 'active')
                            <option value="{{ $heading->id }}" {{ old('heading_id') == $heading->id ? 'selected' : '' }}>{{ $heading->name }}</option>
                        @endif
                    @endforeach
                </select>
            </div>

            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" name="name" id="name" class="form-control" value="{{ old('name') }}" required>
            </div>

            <div class="form-group">
                <label for="status" class="col-md-4 col-form-label text-md-right">Status</label>

                <div class="form-group">
                    <select id="status" class="form-control @error('status') is-invalid @enderror" name="status" required>
                        <option value="active"{{ old('status') == 'active' ? ' selected' : '' }}>Active</option>
                        <option value="inactive"{{ old('status') == 'inactive' ? ' selected' : '' }}>Inactive</option>
                    </select>

                    @error('status')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                    @enderror
                </div>
            </div>

        <div class="form-group text-center">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </form>
</div>
</div>
</div>
</div>
</div>

@endsection