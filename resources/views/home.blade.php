@extends('layouts.user')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="panel">
                <div class="panel-header">{{ __('Dashboard') }}</div>

                <div class="panel-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                    <h>Logged in as  {{auth()->user()->name}} !!!</h>
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-6 text-center"></div>
                        <div class="col-md-3"></div>
                    </div>  
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
