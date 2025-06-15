@extends('layouts.app')
@section('content')
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">News</h1>
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
                        <div class="add-button">
                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal-lg">Add News</button>
                        </div>
                        <br>
                        <table id="example1" class="table">
                            <thead>
                                <tr>
                                    <th>Sl No</th>
                                    <th>News</th>
                                    <th>Url</th>
                                    <th>Display Order</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($news as $i => $n)
                                <tr>
                                    <td>{{ $i+1 }}</td>
                                    <td>{{ $n->news }}</td>
                                    <td><a href="{{ $n->url }}" target="_blank">{{ $n->url }}</a></td>
                                    <td>{{ $n->display_order }}</td>
                                    <td><span class="right badge @if($n->status == 'Active') badge-success @else badge-danger @endif">{{ $n->status }}</span></td>
                                    <td>
                                        <a href="{{ route('news.edit', ['id' => $n->id ]) }}"><span class="badge bg-danger"><i class="fas fa-edit"></i></span></a>
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


  <!-- news add model -->
  <div class="modal fade" id="modal-lg">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add News</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form role="form" method="post" class="col-md-12" enctype="multipart/form-data" action="{{ route('news.save') }}">
                    @csrf

                    <div class="form-group">
                        <label for="exampleInputEmail1">News</label>
                        <input type="text" class="form-control" name="news" placeholder="Enter News" required>
                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">URL</label>
                        <input type="text" class="form-control" name="url" placeholder="Enter URL">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputEmail1">Display Order</label>
                        <input type="number" required class="form-control" name="display_order" min="1" placeholder="Enter Display Order">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputPassword1">Status</label>
                        <select class="form-control" name="status" >
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>

                    <div class="card-footer">
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </form>
                </div>
            </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
  <!-- news add model -->
 
  @endsection
  

                    