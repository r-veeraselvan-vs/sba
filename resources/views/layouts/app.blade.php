<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <link href="{!! asset('theme/vendor/bootstrap/css/bootstrap.min.css') !!}" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="{!! asset('theme/vendor/metisMenu/metisMenu.min.css') !!}" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="{!! asset('theme/dist/css/sb-admin-2.css') !!}" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="{!! asset('theme/vendor/morrisjs/morris.css') !!}" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

    <!-- Custom Fonts -->
    <link href="{!! asset('theme/vendor/font-awesome/css/font-awesome.min.css') !!}" rel="stylesheet" type="text/css">
    <style type="text/css">
        body{
            overflow-x: hidden;
        }
        #hidden{
          display: none;
        }
    </style>
    <style type="text/css" media="print">
    @page 
    {
        size: auto;   /* auto is the initial value */
        margin: 0mm;  /* this affects the margin in the printer settings */
    }
</style>

     <style>
     @media print {
    a[href]:after {
        content: none !important;
    }
}

        @media print {
           #heading {
                display: none;
            }
             .btn-primary {
                display: none;
            }
            
            #myTable, #myTable * {
                visibility: visible;
            }
            
            #myTable {
                margin-top: 0;
                padding-top: 0;
            }
            
            #myTable td:last-child,
            #myTable th:last-child {
                display: none;
            }
            h1 {
              display: none;
            }

            #logo {
              text-align: center;
              margin: 20px 0;
            }
        }
    </style>


</head>
<body>
    
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            @include('theme.header')
            @include('theme.sidebar')
        </nav>

        <div id="page-wrapper">
            @yield('content')
        </div>
    </div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>  
    
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <script>
        function deleteHeading(value) {
          if (confirm("Are you sure you want to delete?")) {
            $.ajax({
              type: 'get',
              url: '{{ route('heading.delete') }}',
              data: { id: value },
              success: function(data) {
                // Show success message
                alert('heading deleted successfully.');

                // Reload the current page
                window.location.reload();
              },
              error: function(xhr, status, error) {
                // Show error message
                alert('Failed to delete heading.');

                // Log the error to the console
                console.error(error);
              }
            });
          }
        }
    </script>
    <script>
        function deleteSubheading(value) {
          if (confirm("Are you sure you want to delete?")) {
            $.ajax({
              type: 'get',
              url: '{{ route('subheading.delete') }}',
              data: { id: value },
              success: function(data) {
                // Show success message
                alert('subheading deleted successfully.');

                // Reload the current page
                window.location.reload();
              },
              error: function(xhr, status, error) {
                // Show error message
                alert('Failed to delete subheading.');

                // Log the error to the console
                console.error(error);
              }
            });
          }
        }
    </script>
    
    <script>
          
        function deleteDaybook(value) {
          if (confirm("Are you sure you want to delete?")) {
            $.ajax({
              type: 'get',
              url: '{{ route('daybook.delete') }}',
              data: { id: value },
              success: function(data) {
                // Show success message
                alert('Daybook deleted successfully.');

                // Reload the current page
                window.location.reload();
              },
              error: function(xhr, status, error) {
                // Show error message
                alert('Failed to delete Daybook.');

                // Log the error to the console
                console.error(error);
              }
            });
          }
        } 
           
        function deletegodownDaybook(value) {
          if (confirm("Are you sure you want to delete?")) {
            $.ajax({
              type: 'get',
              url: '{{ route('godown.delete') }}',
              data: { id: value },
              success: function(data) {
                // Show success message
                alert('GoDownDaybook deleted successfully.');

                // Reload the current page
                window.location.reload();
              },
              error: function(xhr, status, error) {
                // Show error message
                alert('Failed to delete GoDownDaybook.');

                // Log the error to the console
                console.error(error);
              }
            });
          }
        }
           
        function deleteonlineDaybook(value) {
          if (confirm("Are you sure you want to delete?")) {
            $.ajax({
              type: 'get',
              url: '{{ route('online.delete') }}',
              data: { id: value },
              success: function(data) {
                // Show success message
                alert('OnlineDaybook deleted successfully.');

                // Reload the current page
                window.location.reload();
              },
              error: function(xhr, status, error) {
                // Show error message
                alert('Failed to delete OnlineDaybook.');

                // Log the error to the console
                console.error(error);
              }
            });
          }
        }
    </script>
</body>
</html>
