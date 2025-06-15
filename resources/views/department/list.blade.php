@extends('layouts.app')

@section('content')

<div style="margin-top:1rem">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="panel panel-default">
                <div class="panel-header">
                    <div class="row" style="margin-top: -1rem !important;">
                        <div class="col-md-4">
                            <h4 class="page-header" style="margin-left: 10px; border-bottom: none"><b>List of Departments</b></h4>
                        </div>
                        <div class="col-md-6 text-end" style="margin-top: 3rem !important;">
                            <div class="row">
                                <div class="col-md-8">
                                    <input type="text" id="searchInput" class="form-control" placeholder="Search by name">
                                </div>
                                <!--<div class="col-md-4" style="margin-left: -1px;">
                                    <button type="button" class="btn btn-primary" onclick="searchDepartments()">Search</button>
                                </div>-->
                            </div>
                        </div>
                        <div class="col-md-2 text-end" style="margin: 35px 0 20px;    border-bottom: none; margin-top: 3rem !important;">
                            <a href="{{route('department.create')}}"><button class="btn btn-primary">Add</button></a>
                        </div>
                    </div>
                </div>

                <div class="panel-body" style="margin-top: -15px !important;">
                    @if(Session::has('success'))
                        <div class="alert alert-success alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            {{ Session::get('success') }}
                        </div>
                    @endif

                    <div class="container-xl">
                        <div class="table-responsive">
                            <div class="table-wrapper">
                                <div class="table-title"></div>
                                <table class="table table-striped table-hover table-bordered">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="departmentTableBody">
                                        @foreach($departments as $i => $dp)
                                            <tr>
                                                <td>{{ $i + 1 }}</td>
                                                <td>{{ $dp->name }}</td>
                                                <td>{{ $dp->status }}</td>
                                                <td>
                                                    <a href="/sba-hr/public/department/edit/{{ $dp->id }}"><i class="fa fa-edit" style="font-size:20px;color:blue"></i></a>&nbsp
                                                    <a onclick="Delete('{{ $dp->id }}')"><i class="fa fa-trash" style="font-size:20px;color:red"></i></a> 
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
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        $('#searchInput').on('input', function() {
            searchDepartments();
        });

        function searchDepartments() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("searchInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("departmentTableBody");
            tr = table.getElementsByTagName("tr");

            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1]; // Index 1 for the Name column
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    });
</script>

@endsection
