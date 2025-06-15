@extends('layouts.app')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Reviews List</h1>
                </div>
            </div>
        </div>
    </div>
    <!-- /.content-header -->

    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <div class="tab-content">

                    <!-- main Service -->
                    <div class="tab-pane active">
                        <table id="example1" class="table">
                            <thead>
                                <tr>
                                    <th>Sl No</th>
                                    <th>Product</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Reviews & Ratings</th>
                                    <th>Status</th>
                                    <th>Update Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($reviews as $i => $review)
                                <?php 
                                    $user = \App\User::where('id',$review->user_id)->first();
                                ?>
                                <tr>
                                    <td>{{ $i+1 }}</td>
                                    <td>{{ $review->product->name }}</td>
                                    @if (isset($user) && isset($user->name))
                                        <td>{{ ucfirst($user->name) }}</td>
                                    <td>{{ $user->email }}</td>
                                    @else
                                        <td>Name not available</td>
                                    <td>Email not available</td>
                                    @endif

                                    <td>
                                        {{ $review->review }} <br>
                                        <div class="starRating star_{{ $review->ratings }}">
                                            <span>({{ $review->ratings }})</span></div>
                                    </td>
                                    <td><span
                                            class="right badge @if($review->status == 'Active') badge-success @elseif($review->status == 'Submitted') badge-info @else badge-danger @endif">{{ $review->status }}</span>
                                    </td>
                                    <td>
                                        <select name="status" id="status-{{$review->id}}"
                                            onChange="changeStatus({{$review->product_id}}, {{$review->id}})">
                                            <option @if($review->status == 'Submitted') selected @endif
                                                value="Submitted">Submitted</option>
                                            <option @if($review->status == 'Active') selected @endif
                                                value="Active">Active</option>
                                            <option @if($review->status == 'Inactive') selected @endif
                                                value="Inactive">Inactive</option>
                                        </select>
                                    </td>
                                    <td>
                                        <a
                                            href="{{ route('review.delete', [ 'product_id' => $review->product_id, 'id' => $review->id ]) }}"><span
                                                class="badge bg-danger"><i class="fas fa-trash"></i></span></a>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>


                </div>
            </div>
        </div>
    </div>

</div>

<script>
function changeStatus(product_id, id) {
    var status = $('#status-' + id).val();
    var url = "{{ url('admin/review/update') }}" + '/' + product_id + '/' + id + '/' + status;
    window.location = url;
}
</script>

@endsection