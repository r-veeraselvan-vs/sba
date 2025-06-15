@extends('layouts.app')

@section('content')
<div class="content-wrapper" style="min-height: 193px;">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Discount</h1>
                </div>
            </div>
        </div>
    </section>

    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-5">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Edit Discount</h3>
                        </div>
                        <form action="{{ route('discount.update', $discount->id) }}" method="POST" class="col-md-12">
                            @csrf
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input type="text" name="name" class="form-control" id="name" value="{{ $discount->name }}" required>
                                </div>
                                <div class="form-group">
                                    <label for="persent">Discount Percentage</label>
                                    <input type="number" required class="form-control" id="persent" name="persent" value="{{ $discount->persent }}" placeholder="Enter Percentage">
                                    <span id="error-message" style="color: red; display: none;">Please enter only numbers.</span>
                                </div>
                                <div class="form-group">
                                    <label for="product">Products</label>
                                    <select class="selectpicker form-control" id="product" name="product_id[]" multiple data-live-search="true">
                                        @foreach($books as $book)
                                            <option value="{{ $book->id }}" {{ in_array($book->id, $discount->product_id ?? []) ? 'selected' : '' }}>{{ $book->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="from_date">From Date</label>
                                    <input type="date" name="from_date" class="form-control" id="from_date" value="{{ old('from_date', $discount->from_date ? $discount->from_date->format('Y-m-d') : '') }}" required>
                                </div>
                                <div class="form-group">
                                    <label for="to_date">To Date</label>
                                    <input type="date" name="to_date" class="form-control" id="to_date" value="{{ old('to_date', $discount->to_date ? $discount->to_date->format('Y-m-d') : '') }}" required>
                                </div>
                                <div class="form-group">
                                    <label for="status">Status</label>
                                    <select name="status" class="form-control" id="status" required>
                                        <option value="active" {{ $discount->status == 'active' ? 'selected' : '' }}>Active</option>
                                        <option value="inactive" {{ $discount->status == 'inactive' ? 'selected' : '' }}>Inactive</option>
                                    </select>
                                </div>
                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary">Update Discount</button>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="col-md-7">
                    <!-- Placeholder for additional content if needed -->
                </div>
            </div>
        </div>
    </section>
</div>

<!-- Include jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- Include Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<!-- Include Bootstrap Select JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/bootstrap-select.min.js"></script>
<!-- Initialize Bootstrap Select -->
<script>
    $(document).ready(function () {
        $('.selectpicker').selectpicker();
    });

    document.getElementById('persent').addEventListener('input', function (e) {
        const input = e.target;
        const value = input.value;

        const cleanedValue = value.replace(/\D/g, '');

        if (value !== cleanedValue) {
            input.value = cleanedValue;
            document.getElementById('error-message').style.display = 'inline';
            input.classList.add('error');
        } else {
            document.getElementById('error-message').style.display = 'none';
            input.classList.remove('error');
        }
    });
</script>
<script>
function toggleCheckbox() {
    var checkbox = document.getElementById('nature-checkbox');
    var hiddenInput = document.getElementById('nature-hidden');
    
    if (checkbox.checked) {
        hiddenInput.value = 'Book';
    } else {
        hiddenInput.value = '';
    }
}

// Initialize checkbox state
document.addEventListener('DOMContentLoaded', function() {
    var hiddenInput = document.getElementById('nature-hidden');
    var checkbox = document.getElementById('nature-checkbox');

    if (hiddenInput.value === 'Book') {
        checkbox.checked = true;
    } else {
        checkbox.checked = false;
    }
});
</script>
<style>
    .dropdown-menu {
        max-width: 50% !important;
    }
</style>
@endsection
