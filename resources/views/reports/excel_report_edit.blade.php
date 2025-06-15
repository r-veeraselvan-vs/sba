@extends('layouts.app')

@section('content')

<div style="margin-top:3rem">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>Edit PF Report</h4>
                </div>
                <form method="POST" action="{{ route('reports.excel_report_update', $excel_report->id) }}">
                    @csrf
                    @method('POST')
                    <div class="row">
                        <div class="col-md-6">
                            <div class="col-md-6 form-group" style="margin-top:3rem">
                                <label for="uan_number">UAN Number</label>
                                <input type="text" name="uan_number" id="uan_number" class="form-control" value="{{ $excel_report->uan_number }}" readonly required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-6 form-group" style="margin-top:3rem">
                                <label for="name">Name</label>
                                <input type="text" name="name" id="name" class="form-control" value="{{ $excel_report->name }}" readonly required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-6 form-group" style="margin-top:3rem">
                                <label for="gross_salary">Gross Salary</label>
                                <input type="text" name="gross_salary" id="gross_salary" class="form-control" value="{{ $excel_report->gross_salary }}" readonly required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-6 form-group" style="margin-top:3rem">
                                <label for="epf_wages">EPF Wages</label>
                                <input type="text" name="epf_wages" id="epf_wages" class="form-control" value="{{ $excel_report->epf_wages }}" readonly required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-6 form-group" style="margin-top:3rem">
                                <label for="eps_wages">EPS Wages</label>
                                <input type="text" name="eps_wages" id="eps_wages" class="form-control" value="{{ $excel_report->eps_wages }}" readonly required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-6 form-group" style="margin-top:3rem">
                                <label for="edli_wages">EDLI Wages</label>
                                <input type="text" name="edli_wages" id="edli_wages" class="form-control" value="{{ $excel_report->edli_wages }}" readonly required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-6 form-group" style="margin-top:3rem">
                                <label for="epf_contri_remitted">EPF Contri Remitted</label>
                                <input type="text" name="epf_contri_remitted" id="epf_contri_remitted" class="form-control" value="{{ $excel_report->epf_contri_remitted }}" readonly required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-6 form-group" style="margin-top:3rem">
                                <label for="eps_contri_remitted">EPS Contri Remitted</label>
                                <input type="text" name="eps_contri_remitted" id="eps_contri_remitted" class="form-control" value="{{ $excel_report->eps_contri_remitted }}" readonly required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-6 form-group" style="margin-top:3rem">
                                <label for="epf_eps_difference_remitted">EPF EPS Difference Remitted</label>
                                <input type="text" name="epf_eps_difference_remitted" id="epf_eps_difference_remitted" class="form-control" value="{{ $excel_report->epf_eps_difference_remitted }}" readonly required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-6 form-group" style="margin-top:3rem">
                                <label for="ncp_days">NCP Days</label>
                                <input type="text" name="ncp_days" id="ncp_days" class="form-control" value="{{ $excel_report->ncp_days }}" readonly required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-6 form-group" style="margin-top:3rem">
                                <label for="refund_of_advances">Refund of Advances</label>
                                <input type="text" name="refund_of_advances" id="refund_of_advances" class="form-control" value="{{ $excel_report->refund_of_advances }}" required>
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
@endsection
