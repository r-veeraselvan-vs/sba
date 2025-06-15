@extends('layouts.app')
@section('content')
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Send Notification</h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
                <!-- general form elements -->
            <div class="card card-primary">
                <div class="card-header">
                  <h3 class="card-title">Notification</h3>
                </div>
                
                        <!-- tags -->
                        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
                          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />
                          <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
                          <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
                          <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
                          <style type="text/css">
                              .dropdown-toggle{
                                  height: 40px;
                                  width: 100% !important;
                              }
                              .filter{
                                padding: 20px;
                              }
                          </style>
                          <form action="{{ route('notification.group.tag', [ 'type' => $notified_as ] ) }}" method="post">
                              @csrf
                            <div class="filter">
                                <label>Filter Users by Tags:</label><br/>
                                <select class="selectpicker" multiple data-live-search="true" name="selected_tags[]" onChange="this.form.submit()">
                                  @foreach($user_tags as $tag)
                                  <option value="{{ $tag }}" @if(in_array($tag, $selected_tags)) selected @endif>{{ $tag }}</option>
                                  @endforeach
                                </select>
                            </div>
                          </form>
                          <script type="text/javascript">
                              $(document).ready(function() {
                                  $('select').selectpicker();
                              });
                          </script>
                        <!-- tags -->
                        

                <!-- form start -->
            <form action="{{ route('notification.save') }}" method="post" role="form" enctype="multipart/form-data">
                @csrf

                  <div class="card-body row">

                @if ($errors->any())
                    <div class="alert alert-danger col-md-12">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="exampleInputname">Title</label>
                            <div class="">
                                <input type="text" name="title" value="{{ old('title') }}" class="form-control" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputemail">Image</label>
                            <div class="">
                                <input type="file" name="image" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputPassword1">Description</label>
                            <div class="">
                                <textarea name="description" rows="4" class="form-control" required>{{ old('description') }}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">

                        <div class="form-group">
                            <label for="exampleInputname">Notified as</label>
                            <div class="">
                                <input type="text" name="notified_as" value="{{ ucfirst($notified_as) }}" readonly class="form-control" >
                            </div>
                        </div>

                        <div class="form-group">
                     @if($type == 'group')
                        <label>Select Users</label>
                        <select class="form-control" id="users" height="200px" multiple="multiple" name="users[]" data-placeholder="Select User" style="width: 100%;">
                            @foreach($users as $user)
                                <option value="{{ $user->id }}" selected>{{ ucfirst($user->name) }} ({{ $user->email }})</option>
                            @endforeach
                        </select>
                        @elseif($type == 'single')
                        <label>User</label>
                        <select class="form-control" id="users"  multiple="multiple" name="users[]" data-placeholder="Select User" style="width: 100%;">
                            @foreach($users as $user)
                                <option value="{{ $user->id }}" selected>{{ ucfirst($user->name) }} ({{ $user->email }})</option>
                            @endforeach
                        </select>
                        <br />

                        @endif
                        </div>
                    </div>

                  </div>
                  <!-- /.card-body -->

                  <div class="card-footer">
                    <button type="submit" class="btn btn-primary">Send</button>
                  </div>
                </form>
              </div>
              <!-- /.card -->
            </div>
          </div>
          <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
      </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
@endsection
 

<style>
#users{
    height:200px;
}
</style>
