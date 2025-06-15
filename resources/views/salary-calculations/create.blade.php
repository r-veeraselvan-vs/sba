@extends('layouts.app')

@section('content')

<div style="margin-top: 3rem">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>Create Staff Salary Data</h4>
                </div>
                <form method="POST" action="{{ route('salary-calculations.save') }}" onsubmit="return validateForm()">
                    @csrf
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-6 form-group" style="margin-top: 3rem">
                                <label for="staff_id">Name</label>
                                <select name="staff_id" id="staff_id" class="form-control" onchange="staffChange(this.value)" required>
                                    <option value="">Select a Staff Name</option>
                                    @foreach ($staff as $s)
                                    <option value="{{ $s->id }}" {{ old('staff_id') == $s->id ? 'selected' : '' }}>{{ $s->name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="col-md-6 form-group" style="margin-top: 3rem">
                                <label for="gross_salary">{{ __('Gross Salary') }}</label>
                                <input id="gross_salary" type="number" class="form-control @error('gross_salary') is-invalid @enderror" name="gross_salary" value="{{ old('gross_salary') }}" required>

                                @error('gross_salary')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>

                            <div class="col-md-6 form-group" id="basic" style="display: none">
                                <label for="basic">{{ __('Basic') }}</label>
                                <input id="basic" type="number" class="form-control @error('basic') is-invalid @enderror" name="basic" value="{{ old('basic') }}">

                                @error('basic')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>

                            <div class="col-md-6 form-group" id="da" style="display: none;">
                                <label for="da">{{ __('DA') }}</label>
                                <input id="da" type="number" class="form-control @error('da') is-invalid @enderror" name="da" value="{{ old('da') }}">

                                @error('da')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>

                            <div class="col-md-6 form-group" id="other_allowances" style="display:none;">
                                <label for="other_allowances">{{ __('Other Allowances') }}</label>
                                    <input id="other_allowances" type="number" class="form-control @error('other_allowances') is-invalid @enderror" name="other_allowances" value="{{ old('other_allowances') }}">

                                    @error('other_allowances')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                            </div>

                            <div class="col-md-6 form-group" id="hra" style="display:none;">
                                <label for="hra">{{ __('HRA') }}</label>
                                    <input id="hra" type="number" class="form-control @error('hra') is-invalid @enderror" name="hra" value="{{ old('hra') }}">

                                    @error('hra')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                            </div>

                            <div class="col-md-6 form-group" id="pan_no" style="display:none;">
                                <label for="pan_no">UAN No.</label>
                                <input type="text" name="pan_no" id="pan_no" class="form-control" value="{{ old('pan_no') }}">
                            </div>

                            <div class="col-md-6 form-group">
                                <label for="bank">Bank</label>
                                <input type="text" name="bank" id="bank" class="form-control" value="{{ old('bank') }}" required oninput="this.value = this.value.toUpperCase();">
                            </div>

                            <div class="col-md-6 form-group">
                                <label for="account_no">Account No.</label>
                                <input type="text" name="account_no" id="account_no" class="form-control" value="{{ old('account_no') }}" required>
                            </div>

                            <div class="col-md-6 form-group">
                                <label for="ifsc_code">IFSC Code</label>
                                <input type="text" name="ifsc_code" id="ifsc_code" class="form-control" value="{{ old('ifsc_code') }}" required>
                            </div>

                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-primary">Submit</button>
                                <a href="{{ route('salary-calculations.list')}}" type="button" class="btn btn-danger">Cancel</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function staffChange() {
        var staff_id = $('#staff_id').val();
        var staffsArr = @json($staff);
        var filteredArray = staffsArr.filter(x => x.id == staff_id);

        var basicField = document.getElementById('basic');
        var daField = document.getElementById('da');
        var pan_noField = document.getElementById('pan_no');
        var grossSalaryField = document.getElementById('gross_salary');

        if (filteredArray[0]['pf_or_esi'] === "Yes") {
            basicField.style.display = "block";
            daField.style.display = "block";
            pan_noField.style.display = "block";

            basicField.required = true;
            daField.required = true;
            pan_noField.required = true;
        } else {
            basicField.style.display = "none";
            daField.style.display = "none";
            pan_noField.style.display = "none";

            basicField.required = false;
            daField.required = false;
            pan_noField.required = false;
        }

        // Check if basic and da values are greater than gross salary
        var basicValue = parseFloat(basicField.value);
        var daValue = parseFloat(daField.value);
        var grossSalaryValue = parseFloat(grossSalaryField.value);

        if (basicValue > grossSalaryValue || daValue > grossSalaryValue) {
            basicField.setCustomValidity("Basic and DA must be less than or equal to Gross Salary");
        } else {
            basicField.setCustomValidity("");
        }
    }
</script>

@endsection
