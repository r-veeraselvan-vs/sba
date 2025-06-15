@extends('layouts.app')

@section('content')

<div style="margin-top:1rem">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>Edit Subheading</h4>
                  </div>
                  <div class="panel-body">
        <form method="POST" action="{{ route('subheading.update', $subheading->id) }}">
            @csrf
            @method('POST')

            <div class="form-group">
                <label for="heading_id">Heading</label>
                <select name="heading_id" id="heading_id" class="form-control" required>
                    <option value="">Select a heading</option>
                    @foreach ($headings as $head)
                        <option value="{{ $head->id }}" {{ $head->id == $subheading->heading_id ? 'selected' : '' }}>{{ $head->name }}</option>
                    @endforeach
                </select>
            </div>

            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" name="name" id="name" class="form-control" value="{{ $subheading->name }}" required>
            </div>

            <div class="form-group">
                <label for="status" class="col-md-4 col-form-label text-md-right">Status</label>

                <div class="form-group">
                    <select id="status" class="form-control @error('status') is-invalid @enderror" name="status" required>
                        <option value="active" @if ($subheading->status == 'active') selected @endif>Active</option>
                        <option value="inactive" @if ($subheading->status == 'inactive') selected @endif>Inactive</option>
                    </select>

                    @error('status')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                    @enderror
                </div>
            </div>
            
            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary">Update</button>
            </div>

        </form>
    </div>
    </div>
</div>
</div>
</div>

@endsection