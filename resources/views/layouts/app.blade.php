
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="csrf-token" content="{{ csrf_token() }}">
		<title>Madurai Kadai</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="{{ asset('assets/style.css') }}">
		<link rel="stylesheet" href="{{ asset('assets/plugins/fontawesome-free/css/all.min.css') }}">
		<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
		<link rel="stylesheet" href="{{ asset('assets/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css') }}">
		<link rel="stylesheet" href="{{ asset('assets/plugins/icheck-bootstrap/icheck-bootstrap.min.css') }}">
		<link rel="stylesheet" href="{{ asset('assets/plugins/jqvmap/jqvmap.min.css') }}">
		<link rel="stylesheet" href="{{ asset('assets/dist/css/adminlte.min.css') }}">
		<link rel="stylesheet" href="{{ asset('assets/plugins/overlayScrollbars/css/OverlayScrollbars.min.css') }}">
		<link rel="stylesheet" href="{{ asset('assets/plugins/daterangepicker/daterangepicker.css') }}">
		<link rel="stylesheet" href="{{ asset('assets/plugins/summernote/summernote-bs4.css') }}">
		<link rel="stylesheet" href="{{ asset('assets/plugins/daterangepicker/daterangepicker.css') }}">
		<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

		<!-- Select 2 Css -->
		<link rel="stylesheet" href="{{ asset('assets/plugins/select2/css/select2.min.css') }}">
		<link rel="stylesheet" href="{{ asset('assets/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
		<!-- Include Bootstrap Select CSS -->
		<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/css/bootstrap-select.min.css" rel="stylesheet">
		<!-- jQuery -->
		<script src="{{ asset('assets/plugins/jquery/jquery.min.js') }}"></script>
	</head>
	<body class="hold-transition sidebar-mini layout-fixed">
		<div class="wrapper">
			@include('layouts.header')
			@include('layouts.sidebar')
			@yield('content')
			@include('layouts.footer')
			<aside class="control-sidebar control-sidebar-dark">
			</aside>
		</div>
		<script src="{{ asset('assets/plugins/jquery-ui/jquery-ui.min.js') }}"></script>
		<script> $.widget.bridge('uibutton', $.ui.button); </script>
		<script src="{{ asset('assets/plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
		<script src="{{ asset('assets/plugins/chart.js/Chart.min.js') }}"></script>
		<script src="{{ asset('assets/plugins/sparklines/sparkline.js') }}"></script>
		<!-- <script src="{{ asset('assets/plugins/jqvmap/jquery.vmap.min.js') }}"></script> -->
		<!-- <script src="{{ asset('assets/plugins/jqvmap/maps/jquery.vmap.usa.js') }}"></script> -->
		<script src="{{ asset('assets/plugins/jquery-knob/jquery.knob.min.js') }}"></script>
		<script src="{{ asset('assets/plugins/moment/moment.min.js') }}"></script>
		<script src="{{ asset('assets/plugins/daterangepicker/daterangepicker.js') }}"></script>
		<script src="{{ asset('assets/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js') }}"></script>
		<script src="{{ asset('assets/plugins/summernote/summernote-bs4.min.js') }}"></script>
		<script src="{{ asset('assets/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js') }}"></script>
		<script src="{{ asset('assets/dist/js/adminlte.js') }}"></script>
		<script src="{{ asset('assets/dist/js/pages/dashboard.js') }}"></script>
		<script src="{{ asset('assets/dist/js/demo.js') }}"></script>
		<script src="{{ asset('assets/plugins/daterangepicker/daterangepicker.js') }}"></script>
			
		<!-- Toaster -->
		<script src="https://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
		{!! Toastr::message() !!}
		<link rel="stylesheet" href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css">
		<!-- Toaster -->
        <!-- DataTables -->
		<link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">
<script src="{{asset('assets/plugins/datatables/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('assets/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js')}}"></script>
<script src="{{asset('assets/plugins/datatables-responsive/js/dataTables.responsive.min.js')}}"></script>
<script src="{{asset('assets/plugins/datatables-responsive/js/responsive.bootstrap4.min.js')}}"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script> 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>

<!-- Select 2 -->
<script src="{{asset('assets/plugins/select2/js/select2.full.min.js')}}"></script>
<script>
      history.pushState(null, null, location.href);
    window.onpopstate = function () {
        history.go(1);
    };</script>
<script>
    $(function () {
      $(".table_data").DataTable({
        "responsive": true,
        "autoWidth": false,
      });
//       $("#example1").DataTable({
//         "responsive": true,
//         "autoWidth": false,
// 		"searching": true,      
// 		"paging": false,     
// 		"pageLength": 100,     
// 		"lengthMenu": [ [50, 75, 100], [50, 75, 100] ]
//       });

      $('#example2').DataTable({
        "autoWidth": false,
        "responsive": true,
      });
      
      $("#example11").DataTable({
        "responsive": true,
        "autoWidth": false,
      });   

    });

  </script>





  <style>
div#example1_filter {
    float: right;
}
div#export_filter {
    float: right;
}
div#example11_filter {
    float: right;
}
div#example1_paginate {
    float: right;
}
div#export_paginate {
    float: right;
}
div#example11_paginate {
    float: right;
}

.add-button {
    text-align: right;
}

.form-check {
    padding-left: 2.25rem !important;
}

.table
{
word-wrap: break-word;
word-break: break-all;  
white-space: normal !important;
text-align: justify;
}


.dataTables_wrapper .dataTables_paginate .paginate_button {
    padding: 0px !important;
}
  </style>
  
    <script type="text/javascript">
   

function exportTableToExcel(tableID, filename, fn, dl) {
       var elt = document.getElementById(tableID);
       var wb = XLSX.utils.table_to_book(elt, { sheet: "sheet1" });
       return dl ?
         XLSX.write(wb, { bookType: 'xlsx', bookSST: true, 'xlsx': 'base64' }):
         XLSX.writeFile(wb, fn || (filename+'.xlsx' ));
    }

    function exportBiometricToExcel(tableID, filename, fn, dl)
    {
        var elt = document.getElementById(tableID);
       var wb = XLSX.utils.table_to_book(elt, { sheet: "sheet1" });
       console.log(elt,"wb");
        return dl ?
        XLSX.write(wb, { bookType: 'xlsx', bookSST: true, 'xlsx': 'base64' }):
       XLSX.writeFile(wb, fn || (filename+'.xlsx' ));
    
    }
</script>
	</body>
</html>
