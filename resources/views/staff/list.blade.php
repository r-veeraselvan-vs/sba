@extends('layouts.app')

@section('content')

<div style="margin-top:3rem">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="panel panel-default">
                <div class="panel-header">
                    <div class="row" style="margin-top: -1rem !important;">
                        <div class="col-md-4">
                            <h4 class="page-header" style="margin-left: 10px; border-bottom: none"><b>List of Staffs</b></h4>
                        </div>
                        <div class="col-md-6 text-end" style="margin-top: 3rem !important;">
                            <div class="row">
                                <div class="col-md-8">
                                    <input type="text" id="search-input" class="form-control" placeholder="Search by name, phone number, or department" value="{{ old('search') }}">
                                </div>
                               <!-- <div class="col-md-4" style="margin-left: -1px;">
                                    <button type="button" id="search-button" class="btn btn-primary"></button>
                                </div>-->
                            </div>
                        </div>
                        <div class="col-md-2 text-end" style="margin: 35px 0 20px;    border-bottom: none; margin-top: 3rem !important;">
                            <a href="{{route('staff.create')}}"><button class="btn btn-primary">Add</button></a>
                        </div>
                    </div>
                </div>

                <div class="panel-body" style="margin-top: -15px !important;">
                     @if( Session::has( 'success' ))
          <div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  {{ Session::get('success') }}
</div>
        @endif
        @if( Session::has( 'warning' ))
          <div class="alert alert-warning alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  {{ Session::get('warning') }}
</div>
        @endif
                  
                    <div class="container-xl">
                        <div class="table-responsive">
                            <div class="table-wrapper">
                                <div class="table-title"></div>
                                <table class="table table-striped table-hover table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Department</th>
                                            <th>Phone Number</th>
                                            <th>Actual Date of Joining</th>
                                            <th>PF/ESI</th>
                                            <th>Date of Incorporation in PF</th>
                                            <th>Date of Birth</th>
                                            <th>Age</th>
                                            <th>Wedding Day</th>
                                            <th>Supply Zone</th>
                                            <th>Supply Area</th>
                                            <th>Number of Active Customers</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                        @foreach($staff as $s)
                                            <tr>
                                                <td>{{ $s->name }}</td>
                                                <?php 
                                                    $department =  \App\Models\Department::where('id',$s->department_id)->first();
                                                    $zone =  \App\Models\SupplyZone::where('id',$s->supply_zone_id)->first();
                                                    $area =  \App\Models\SupplyArea::where('id',$s->supply_area_id)->first();
                                                ?>
                                                    @if($department!=null)
                                                    <td>{{ $department->name }}</td>
                                                    @else
                                                    <td>-</td>
                                                    @endif
                                                <td>{{ $s->phone_number }}</td>
                                                <td>{{ $s->actual_date_of_joining }}</td>
                                                <td>{{ $s->pf_or_esi }}</td>
                                                <td>{{ ($s->date_of_incorporation_in_pf != null) ? $s->date_of_incorporation_in_pf : '-' }}</td>
                                                <td>{{ $s->date_of_birth }}</td>
                                                <td>{{ $s->age }}</td>
                                                <td>{{ $s->wedding_day }}</td>
                                                 @if($zone!=null)
                                                    <td>{{ $zone->name }}</td>
                                                    @else
                                                    <td>-</td>
                                                    @endif
                                                    @if($area!=null)
                                                    <td>{{ $area->name }}</td>
                                                    @else
                                                    <td>-</td>
                                                    @endif
                                                 <td>{{ $s->number_of_active_customers }}</td>
                                                <td>
                                                    <a href="{{ route('staff.edit', ['id' => $s->id ]) }}" ><i class="fa fa-edit" style="font-size:20px;color:blue"></i></a>&nbsp                                                    <a onclick="Deletestaff('{{$s->id}}')"><i class="fa fa-trash" style="font-size:20px;color:red"></i></a>
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
        $('#search-button').click(function() {
            search();
        });

        $('#search-input').on('input', function() {
            search();
        });

        function search() {
            var searchQuery = $('#search-input').val().trim().toLowerCase();
            $('tbody tr').each(function() {
                var name = $(this).find('td:first-child').text().toLowerCase();
                var phoneNumber = $(this).find('td:nth-child(3)').text().toLowerCase();
                var department = $(this).find('td:nth-child(2)').text().toLowerCase();
                if (name.includes(searchQuery) || phoneNumber.includes(searchQuery) || department.includes(searchQuery)) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        }
    });
</script>


@endsection

