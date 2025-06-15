@extends('layouts.app')

@section('content')
    <style>
        .error {
            border: 2px solid red;
        }
    </style>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4 class="m-0 text-dark text-bold">Discounts</h4>
                </div>
                <div class="col-sm-6 add-button">
                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal-lg">Add Discount</button>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="tab-content">

                            <!-- Main Service -->
                            <div class="tab-pane active">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Percent</th>
                                            <th>Product</th>
                                            <th>From Date</th>
                                            <th>To Date</th>
                                            <th>Status</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    @foreach ($discounts as $discount)
                                        <tr>
                                            <td>{{ $discount->id }}</td>
                                            <td>{{ $discount->name }}</td>
                                            <td>{{ $discount->persent }}</td>
                                            <td>
                                                @if(is_array($discount->product_id) && count($discount->product_id) > 0)
                                                    @foreach($discount->product_id as $index => $productId)
                                                        {{ $index + 1 }}. {{ $books[$productId] ?? 'N/A' }}<br>
                                                    @endforeach
                                                @else
                                                    N/A
                                                @endif
                                            </td>
                                            <td>{{ \Carbon\Carbon::parse($discount->from_date)->format('d-m-y') }}</td>
                                            <td>{{ \Carbon\Carbon::parse($discount->to_date)->format('d-m-y') }}</td>
                                            <td>{{ $discount->status }}</td>
                                            <td>
                                                <a href="{{ route('discount.edit', $discount->id) }}">
                                                    <span class="badge bg-info"><i class="fas fa-eye"></i></span>
                                                </a>
                                                <form id="delete-form-{{ $discount->id }}" action="{{ route('discount.destroy', $discount->id) }}" method="POST" style="display:inline-block;">
                                                    @csrf
                                                    <a href="javascript:void(0);" class="badge bg-danger" onclick="document.getElementById('delete-form-{{ $discount->id }}').submit();" title="Delete">
                                                        <i class="fas fa-trash"></i>
                                                    </a>
                                                </form>
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>

                            </div> <!-- end tab-pane -->

                        </div> <!-- end tab-content -->
                    </div> <!-- end card-body -->
                </div> <!-- end card -->
            </div> <!-- end col-md-12 -->
        </div> <!-- end row -->
    </div> <!-- end container -->

</div> <!-- end content-wrapper -->

<div class="modal fade" id="modal-lg">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Discount</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form role="form" method="post" class="col-md-12" enctype="multipart/form-data" action="{{ route('discount.store') }}">
                    @csrf

                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" required class="form-control" name="name" placeholder="Enter Name">
                    </div>

                    <div class="form-group">
                        <label for="persent">Discount Percentage</label>
                        <input type="text" required class="form-control" id="persent" name="persent" placeholder="Enter Percentage">
                        <span id="error-message" style="color: red; display: none;">Please enter only numbers.</span>
                    </div>

                    <div class="form-group">
                        <label for="product_id">Products</label>
                        <select class="selectpicker form-control" multiple data-live-search="true" name="product_id[]">
                            @foreach ($book as $b)
                                <option class="form-control" value="{{ $b->id }}" style="width: 50%">{{ $b->name }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="from_date">From Date</label>
                        <input type="date" required class="form-control" name="from_date">
                    </div>

                    <div class="form-group">
                        <label for="to_date">To Date</label>
                        <input type="date" required class="form-control" name="to_date">
                    </div>

                    <div class="form-group">
                        <label for="status">Status</label>
                        <select class="form-control" name="status">
                            <option value="active">Active</option>
                            <option value="inactive">Inactive</option>
                        </select>
                    </div>

                    <div class="card-footer">
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
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
</script>
<style>
    .dropdown-menu {
        max-width: 50% !important;
    }
</style>
@endsection
