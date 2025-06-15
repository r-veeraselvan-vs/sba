@extends('layouts.app')

@section('content')

<div style="margin-top:3rem">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>Edit Staff</h4>
                  </div>
        <form method="POST" action="{{ route('staff.update', $staff->id) }}">
            @csrf
            @method('POST')
            <div class="row">
                <div class="col-md-12">
                <div class="col-md-6 form-group" style="margin-top:3rem">
                <label for="name">Name</label>
                <input type="text" name="name" id="name" class="form-control" value="{{ $staff->name }}" required>
            </div>

            <div class="col-md-6 form-group" style="margin-top:3rem">
                <label for="department_id">Department</label>
                <select name="department_id" id="department_id" class="form-control"  onchange="selectDepartment(this.value)" required>
                    <option value="">Select a department</option>
                    @foreach ($departments as $department)
                        <option value="{{ $department->id }}" {{ $department->id == $staff->department_id ? 'selected' : '' }}>{{ $department->name }}</option>
                    @endforeach
                </select>
            </div>

            <div class="col-md-6 form-group">
                <label for="phone_number">Phone Number</label>
                <input type="text" name="phone_number" id="phone_number" class="form-control" value="{{ $staff->phone_number }}" required pattern="[0-9]{10}">
            </div>

            <div class="col-md-6 form-group">
                <label for="actual_date_of_joining">Actual Date of Joining</label>
                <input type="date" name="actual_date_of_joining" id="actual_date_of_joining" class="form-control" value="{{ $staff->actual_date_of_joining }}" required>
            </div>
            
            <div class="col-md-6 form-group">
                <label for="pf_or_esi">PF/ESI</label>
                <select id="pf_or_esi" type="text" class="form-control" name="pf_or_esi" id="pf_or_esi" onchange="selectPForESI(this.value)">
                    <option value="">Select</option>
                        <option value="Yes" @if("Yes" == $staff->pf_or_esi) selected @endif>Yes</option>
                        <option value="No" @if("No" == $staff->pf_or_esi) selected @endif>No</option>
                    </select>
            </div>

            <div class="col-md-6 form-group" id="date_of_incorporation_in_pf" style="display:none">
                <label for="date_of_incorporation_in_pf">Date of Incorporation in PF</label>
                <input type="date" name="date_of_incorporation_in_pf" id="date_of_incorporation_in_pf" class="form-control" value="{{ $staff->date_of_incorporation_in_pf }}">
            </div>

            <div class="col-md-6 form-group">
                <label for="date_of_birth">Date of Birth</label>
                <input type="date" name="date_of_birth" id="date_of_birth" class="form-control" value="{{ $staff->date_of_birth }}" max="{{ date('Y-m-d') }}" required>
            </div>

            <div class="col-md-6 form-group">
                <label for="age">Age</label>
                <input type="text" name="age" id="age" class="form-control" value="{{ $staff->age }}" required>
            </div>         

            <div class="col-md-6 form-group">
                <label for="wedding_day">Wedding Day</label>
                <input type="date" name="wedding_day" id="wedding_day" class="form-control" value="{{ $staff->wedding_day }}">
            </div>

            <div class="col-md-6 form-group" id="supply_zone_id">
                <label for="supply_zone_id">Supply Zone</label>
                <select name="supply_zone_id" id="supply_zone_id_value" class="form-control">
                    <option value="">Select a supply zone</option>
                    @foreach ($supply_zones as $supply_zone)
                        <option value="{{ $supply_zone->id }}" {{ $supply_zone->id == $staff->supply_zone_id ? 'selected' : '' }}>{{ $supply_zone->name }}</option>
                    @endforeach
                </select>
            </div>

            <div class="col-md-6 form-group" id="supply_area_id" >
                <label for="supply_area_id">Supply Area</label>
                <select name="supply_area_id" id="supply_area_id_value" class="form-control" >
                    <option value="">Select a supply area</option>
                    @foreach ($supply_areas as $supply_area)
                        <option value="{{ $supply_area->id }}" {{ $supply_area->id == $staff->supply_area_id ? 'selected' : '' }}>{{ $supply_area->name }}</option>
                    @endforeach
                </select>
            </div>

            <div class="col-md-6 form-group" id="number_of_active_customers" >
                <label for="number_of_active_customers">Number of Active Customers</label>
                <input type="number" name="number_of_active_customers"  id="number_of_active_customers_value" class="form-control" value="{{ $staff->number_of_active_customers }}" >
            </div>
                </div>
            </div>
            <div class="row">
            <div class="col-md-12">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-6"><h4>Emergency Contact 1</h4></div>
                        <div class="col-md-6"><h4>Emergency Contact 2</h4></div>
                    </div>
                </div>
            <div class="col-md-6 form-group">
                <label for="name">Contact Name</label>
                <input type="text" name="emergency_contact_name" id="emergency_contact_name" class="form-control" value="{{ $staff->emergency_contact_name }}">
            </div>
            <div class="col-md-6 form-group">
                <label for="name">Contact Name</label>
                <input type="text" name="emergency_contact_name2" id="emergency_contact_name2" class="form-control" value="{{ $staff->emergency_contact_name2 }}">
            </div>
            <div class="col-md-6 form-group">
                <label for="relation">Relation</label>
                <select name="relation" class="form-control">
                        <option value="">Select</option>
                          <option value="Parent" @if("Parent" == $staff->relation) selected @endif>Parent</option>
                          <option value="Sibling" @if("Sibling" == $staff->relation) selected @endif>Sibling</option>
                          <option value="Spouse" @if("Spouse" == $staff->relation) selected @endif>Spouse</option>
                          <option value="Friend" @if("Friend" == $staff->relation) selected @endif>Friend</option>
                          <option value="Guardian" @if("Guardian" == $staff->relation) selected @endif>Gaurdian</option>
                        </select>
            </div>
            <div class="col-md-6 form-group">
                <label for="relation2">Relation</label>
                <select name="relation2" class="form-control">
                        <option value="">Select</option>
                          <option value="Parent" @if("Parent" == $staff->relation2) selected @endif>Parent</option>
                          <option value="Sibling" @if("Sibling" == $staff->relation2) selected @endif>Sibling</option>
                          <option value="Spouse" @if("Spouse" == $staff->relation2) selected @endif>Spouse</option>
                          <option value="Friend" @if("Friend" == $staff->relation2) selected @endif>Friend</option>
                          <option value="Guardian" @if("Guardian" == $staff->relation2) selected @endif>Gaurdian</option>
                        </select>
            </div>
            <div class="col-md-6 form-group">
                <label for="contact_number">Contact Number</label>
                <input type="text" name="contact_number" id="contact_number" class="form-control" value="{{ $staff->contact_number }}" pattern="[0-9]{10}">
            </div>
            <div class="col-md-6 form-group">
                <label for="contact_number2">Contact Number</label>
                <input type="text" name="contact_number2" id="contact_number2" class="form-control" value="{{ $staff->contact_number2 }}" pattern="[0-9]{10}">
            </div>
            </div>
            </div>
           <div class="row">

            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
 </div>
        </form>
    </div>
</div>
</div>
</div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script>

$(document).ready(function() {
    var1 = document.getElementById('department_id').value;
    selectDepartment(var1);

})
    function selectDepartment(value)
    {
        if(value=="14")
        {
            document.getElementById('number_of_active_customers').style.display="block";
            document.getElementById('supply_area_id').style.display="block";
            document.getElementById('supply_zone_id').style.display="block";

            document.getElementById('number_of_active_customers').required = true;
            document.getElementById('supply_area_id').required = true;
            document.getElementById('supply_zone_id').required = true;
        }
        else
        {
            document.getElementById('number_of_active_customers_value').value="";
            document.getElementById('supply_area_id_value').value="";
            document.getElementById('supply_zone_id_value').value="";
            
            document.getElementById('number_of_active_customers').style.display="none";
            document.getElementById('supply_area_id').style.display="none";
            document.getElementById('supply_zone_id').style.display="none";

            document.getElementById('number_of_active_customers').required = false;
            document.getElementById('supply_area_id').required = false;
            document.getElementById('supply_zone_id').required = false;
        }
    }
    function selectPForESI(value)
    {
        if(value=="Yes")
        {
            document.getElementById('date_of_incorporation_in_pf').style.display="block";
            document.getElementById('date_of_incorporation_in_pf').required = true;
        } else {
            document.getElementById('date_of_incorporation_in_pf').style.display="none";
            document.getElementById('date_of_incorporation_in_pf').required = false;
        }
    }
</script>
@endsection
