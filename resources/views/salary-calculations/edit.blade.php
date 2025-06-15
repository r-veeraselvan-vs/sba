@extends('layouts.app')

@section('content')

<div style="margin-top:3rem">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>Edit Staff Salary Data</h4>
                  </div>

@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
@if (session()->has('warning'))
    <div class="alert alert-warning">
        {{ session('warning') }}
    </div>
@endif


        <form method="POST" action="{{ route('salary-calculations.update', $salaryCalculations->id) }}"  id="edit_salary_data" onsubmit="return myFunction()">
            @csrf
             <div class="row">
                <div class="col-md-12">

           <div class="col-md-6 form-group" style="margin-top:3rem">
                <label for="staff_id">Name</label>
                <input name="staff_id" id="staff_id" type="hidden" class="form-control" value="{{$salaryCalculations->staff_id}}">
                 <?php 
                    $s = \App\Models\Staff::where('id',$salaryCalculations->staff_id)->first();
                 ?>                
                <input name="name" id="name" type="text" class="form-control" value="{{$s->name}}" readonly>
            </div>

                            <div class="col-md-6 form-group" style="margin-top:3rem">
                                <label for="gross_salary" >{{ __('Gross Salary') }}</label>
                                    <input id="gross_salary" type="number" class="form-control @error('gross_salary') is-invalid @enderror" name="gross_salary" value="{{ $salaryCalculations->gross_salary }}" required>

                                    @error('gross_salary')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                            </div>

                            <div class="col-md-6 form-group" id="basic">
                                <label for="basic">{{ __('Basic') }}</label>
                                <input id="basic_value" type="number" class="form-control @error('basic') is-invalid @enderror" name="basic" value="{{ old('basic', $salaryCalculations->basic) }}">
                                @error('basic')
                                    <span class="invalid-feedback" role="alert" style="color: red;">
                                        <strong>{{ $message }}</strong>
                                        {{dd($error)}};
                                    </span>
                                @enderror
                            </div>

                            <div class="col-md-6 form-group" id="da" >
                                <label for="da">{{ __('DA') }}</label>
                                <input id="da_value" type="number" class="form-control @error('da') is-invalid @enderror" name="da" value="{{ $salaryCalculations->da }}">

                                    @error('da')
                                        <span class="invalid-feedback" role="alert" style="color: red;">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                            </div>

                            <div class="col-md-6 form-group" id="other_allowances" >
                                <label for="other_allowances">{{ __('Other Allowances') }}</label>
                                    <input id="other_allowances_value" type="number" class="form-control @error('other_allowances') is-invalid @enderror" name="other_allowances" value="{{ $salaryCalculations->other_allowances }}">

                                    @error('other_allowances')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                            </div>

                            <div class="col-md-6 form-group" id="hra"  >
                                <label for="hra">HRA</label>
                                <input type="text" name="hra" id="hra" class="form-control" value="{{ $salaryCalculations->hra }}">
                            </div>

                            <div class="col-md-6 form-group" id="pan_no" >
                                <label for="pan_no">UAN No.</label>
                                <input type="text" name="pan_no" id="pan_no" class="form-control" value="{{ $salaryCalculations->pan_no }}">
                            </div>
                           
                            <div class="col-md-6 form-group">
                                <label for="bank">Bank</label>
                                <input type="text" name="bank" id="bank" class="form-control" value="{{ $salaryCalculations->bank }}" required oninput="this.value = this.value.toUpperCase();">
                            </div>

                            <div class="col-md-6 form-group">
                                <label for="account_no">Account No.</label>
                                <input type="text" name="account_no" id="account_no" class="form-control" value="{{ $salaryCalculations->account_no}}" required>
                            </div>

                            <div class="col-md-6 form-group">
                                <label for="ifsc_code">IFSC Code</label>
                                <input type="text" name="ifsc_code" id="ifsc_code" class="form-control" value="{{ $salaryCalculations->ifsc_code }}" required>
                            </div>

        </div>

            <div class="form-group text-center">
                <button type="submit" id="submit" class="btn btn-primary" >Update</button>
            </div>
    </div>
</form>
</div>
</div>
</div>
</div>
<script>
 
function myFunction() {
   var basic = document.getElementById('basic_value').value;
   var da = document.getElementById('da_value').value;
   var other_allowances = document.getElementById('other_allowances_value').value;
   var gross_salary = document.getElementById('gross_salary').value;
   var total = parseFloat(basic)+parseFloat(da)+parseFloat(other_allowances);
   console.log(total,"total");
     if(total>gross_salary)
   {
       alert("Gross salary cannot be less than basic , da , other allowances");
       return false;
   }
   
 }
</script>
<script>
    var pf_or_esi = "{{ $s->pf_or_esi }}"; 
    var pan_noInput = document.getElementById("pan_no");

    if (pf_or_esi === "Yes") {
        document.getElementById("basic").style.display = "block";
        document.getElementById("da").style.display = "block";
        document.getElementById("other_allowances").style.display = "block";
        document.getElementById("hra").style.display = "block";
        document.getElementById("pan_no").style.display = "block";
        pan_noInput.required = true; 
    } else {
        document.getElementById("basic").style.display = "none";
        document.getElementById("da").style.display = "none";
        document.getElementById("other_allowances").style.display = "none";
        document.getElementById("hra").style.display = "none";
        document.getElementById("pan_no").style.display = "none";
        pan_noInput.required = false; 
    }
</script>
@endsection