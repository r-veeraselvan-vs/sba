@extends('layouts.app')

@section('content')

<div style="margin-top:3rem">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>Create Staff</h4>
                  </div>
        <form method="POST" action="{{ route('staff.save') }}">
            @csrf
            <div class="row">
                <div class="col-md-12">
            <div class="col-md-6 form-group" style="margin-top:3rem">
                <label for="name">Name</label>
                <input type="text" name="name" id="name" class="form-control" value="{{ old('name') }}" required>
            </div>

            <div class="col-md-6 form-group" style="margin-top:3rem">
                <label for="department_id">Department</label>
                <select name="department_id" id="department_id" class="form-control" onchange="selectDepartment(this.value)" required>
                    <option value="">Select a department</option>
                    @foreach ($departments as $department)
                        <option value="{{ $department->id }}" {{ old('department_id') == $department->id ? 'selected' : '' }}>{{ $department->name }}</option>
                    @endforeach
                </select>
            </div>

            <div class="col-md-6 form-group">
                <label for="phone_number">Phone Number</label>
                <input type="text" name="phone_number" id="phone_number" class="form-control" value="{{ old('phone_number') }}" pattern="[0-9]{10}" required>
            </div>

            <div class="col-md-6 form-group">
                <label for="actual_date_of_joining">Actual Date of Joining</label>
                <input type="date" name="actual_date_of_joining" id="actual_date_of_joining" class="form-control" value="{{ old('actual_date_of_joining') }}" required>
            </div>

            <div class="col-md-6 form-group">
                <label for="pf_or_esi">PF/ESI</label>
                <select name="pf_or_esi" id="pf_or_esi" onchange="selectPForESI(this.value)" class="form-control" required>
                    <option value="">Select</option>
                    <option value="Yes">Yes</option>
                    <option value="No">No</option>
                </select>
            </div>

            <div class="col-md-6 form-group" id="date_of_incorporation_in_pf" style="display:none">
                <label for="date_of_incorporation_in_pf">Date of Incorporation in PF</label>
                <input type="date" name="date_of_incorporation_in_pf" id="date_of_incorporation_in_pf" class="form-control" value="{{ old('date_of_incorporation_in_pf') }}">
            </div>

            <div class="col-md-6 form-group">
                <label for="date_of_birth">Date of Birth</label>
                <input type="date" name="date_of_birth" id="date_of_birth" class="form-control" value="{{ old('date_of_birth') }}" max="{{ date('Y-m-d') }}"  required>
            </div>

            <div class="col-md-6 form-group">
                <label for="age">Age</label>
                <input type="text" name="age" id="age" class="form-control" value="{{ old('age') }}"  required>
            </div>

            <div class="col-md-6 form-group">
                <label for="wedding_day">Wedding Day</label>
                <input type="date" name="wedding_day" id="wedding_day" class="form-control" value="{{ old('wedding_day') }}" max="{{ date('Y-m-d') }}">
            </div>

            <div class="col-md-6 form-group"  id="supply_zone_id" style="display:none">
                <label for="supply_zone_id">Supply Zone</label>
                <select name="supply_zone_id" class="form-control">
                    <option value="">Select a supply zone</option>
                    @foreach ($supply_zones as $supply_zone)
                        <option value="{{ $supply_zone->id }}" {{ old('supply_zone_id') == $supply_zone->id ? 'selected' : '' }}>{{ $supply_zone->name }}</option>
                    @endforeach
                </select>
            </div>

            <div class="col-md-6 form-group" id="supply_area_id" style="display:none">
                <label for="supply_area_id">Supply Area</label>
                <select name="supply_area_id"  class="form-control">
                    <option value="">Select a supply area</option>
                    @foreach ($supply_areas as $supply_area)
                        <option value="{{ $supply_area->id }}" {{ old('supply_area_id') == $supply_area->id ? 'selected' : '' }}>{{ $supply_area->name }}</option>
                @endforeach
            </select>
        </div>

        <div class="col-md-6 form-group" id="number_of_active_customers" style="display:none">
            <label for="number_of_active_customers">Number of Active Customers</label>
            <input type="number" name="number_of_active_customers"  class="form-control" value="{{ old('number_of_active_customers') }}">
        </div>
        
<hr>

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
                <input type="text" name="emergency_contact_name" id="emergency_contact_name" class="form-control" value="{{ old('emergency_contact_name') }}">
            </div>

            <div class="col-md-6 form-group">
                <label for="name">Contact Name</label>
                <input type="text" name="emergency_contact_name2" id="emergency_contact_name2" class="form-control" value="{{ old('emergency_contact_name2') }}">
            </div>

            <div class="col-md-6 form-group">
                <label for="relation">Relation</label>
                <select name="relation" class="form-control">
                        <option value="">Select</option>
                          <option value="Parent">Parent</option>
                          <option value="Sibling">Sibling</option>
                          <option value="Spouse">Spouse</option>
                          <option value="Friend">Friend</option>
                          <option value="Guardian">Guardian</option>
                        </select>
            </div>

            <div class="col-md-6 form-group">
                <label for="relation2">Relation</label>
                <select name="relation2" class="form-control">
                        <option value="">Select</option>
                          <option value="Parent">Parent</option>
                          <option value="Sibling">Sibling</option>
                          <option value="Spouse">Spouse</option>
                          <option value="Friend">Friend</option>
                          <option value="Guardian">Guardian</option>
                        </select>
            </div>

            <div class="col-md-6 form-group">
                <label for="contact_number">Phone Number</label>
                <input type="text" name="contact_number" id="contact_number" class="form-control" value="{{ old('contact_number') }}" pattern="[0-9]{10}">
            </div>
            <div class="col-md-6 form-group">
                <label for="contact_number2">Phone Number</label>
                <input type="text" name="contact_number2" id="contact_number2" class="form-control" value="{{ old('contact_number2') }}" pattern="[0-9]{10}">
            </div>
</div>
            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        
    </div>
    </form>
</div>
</div>
</div>
</div>
<script>
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
