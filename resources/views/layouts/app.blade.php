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
        }.badge-info {
    color: #fff;
    background-color: #17a2b8;
}
.badge-danger {
    color: #fff;
    background-color: #dc3545;
}
.error {
    color: red;
    font-size: 14px;
    margin-top: 5px;
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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>  
    
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

<script type="text/javascript">
    function exportTableToExcel(tableID, filename = '') {
        var downloadLink;
        var dataType = 'application/vnd.ms-excel';
        var tableSelect = document.getElementById(tableID);
        var tableHTML = '<table><thead><tr>';

        // Iterate through each column in the table and append the header to the tableHTML string
        for (var i = 0; i < tableSelect.rows[0].cells.length; i++) {
            if (tableSelect.rows[0].cells[i].innerText !== 'Action') {
                tableHTML += '<th>' + tableSelect.rows[0].cells[i].innerHTML + '</th>';
            }
        }

        // Close the thead and open tbody
        tableHTML += '</tr></thead><tbody>';

        // Iterate through each row in the table and append the cells to the tableHTML string
        for (i = 1; i < tableSelect.rows.length; i++) {
            tableHTML += '<tr>';
            for (var j = 0; j < tableSelect.rows[i].cells.length; j++) {
                if (tableSelect.rows[0].cells[j].innerText !== 'Action') {
                    tableHTML += '<td>' + tableSelect.rows[i].cells[j].innerHTML + '</td>';
                }
            }
            tableHTML += '</tr>';
        }

        // Close the tbody and table tags
        tableHTML += '</tbody></table>';

        // Specify file name
        filename = filename ? filename + '.xls' : 'excel_data.xls';

        // Create download link element
        downloadLink = document.createElement("a");

        document.body.appendChild(downloadLink);

        if (navigator.msSaveOrOpenBlob) {
            var blob = new Blob(['\ufeff', tableHTML], {
                type: dataType
            });
            navigator.msSaveOrOpenBlob(blob, filename);
        } else {
            // Create a link to the file
            downloadLink.href = 'data:' + dataType + ', ' + tableHTML;

            // Setting the file name
            downloadLink.download = filename;

            // Triggering the function
            downloadLink.click();
        }
    }
</script>

   <script>
        function Delete(value) {
          if (confirm("Are you sure you want to delete?")) {
            $.ajax({
              type: 'get',
              url: '{{ route('department.delete') }}',
              data: { id: value },
              success: function(data) {
                // Show success message
                alert('Department deleted successfully.');

                // Reload the current page
                window.location.reload();
              },
              error: function(xhr, status, error) {
                // Show error message
                alert('Failed to delete department.');

                // Log the error to the console
                console.error(error);
              }
            });
          }
        }
    </script>
    <script>
        function Deletesupplyzone(value) {
          if (confirm("Are you sure you want to delete?")) {
            $.ajax({
              type: 'get',
              url: '{{ route('supplyzone.delete') }}',
              data: { id: value },
              success: function(data) {
                // Show success message
                alert('supplyzone deleted successfully.');

                // Reload the current page
                window.location.reload();
              },
              error: function(xhr, status, error) {
                // Show error message
                alert('Failed to delete supplyzone.');

                // Log the error to the console
                console.error(error);
              }
            });
          }
        }
    </script>
    <script>
        function Deletesupplyarea(value) {
          if (confirm("Are you sure you want to delete?")) {
            $.ajax({
              type: 'get',
              url: '{{ route('supplyarea.delete') }}',
              data: { id: value },
              success: function(data) {
                // Show success message
                alert('supplyarea deleted successfully.');

                // Reload the current page
                window.location.reload();
              },
              error: function(xhr, status, error) {
                // Show error message
                alert('Failed to delete supplyarea.');

                // Log the error to the console
                console.error(error);
              }
            });
          }
        }
    </script>
    <script>
        function Deletestaff(value) {
            if (confirm("Are you sure you want to delete?")) {
                $.ajax({
                    type: 'get',
                    url: '{{ route('staff.delete') }}',
                    data: { id: value },
                    success: function(data) {
                        // Show success message
                        alert('Staff deleted successfully.');

                        // Reload the current page
                        window.location.reload();
                    },
                    error: function(xhr, status, error) {
                        // Show error message
                        alert('Failed to delete staff.');

                        // Log the error to the console
                        console.error(error);
                    }
                });
            }
        }
    </script>
        <script>
        function DeleteSalaryCalculation(value) {
          if (confirm("Are you sure you want to delete?")) {
            $.ajax({
              type: 'get',
              url: '{{ route('salary-calculations.delete') }}',
              data: { id: value },
              success: function(data) {
                // Show success message
                alert('Staff Salary Data deleted successfully.');

                // Reload the current page
                window.location.reload();
              },
              error: function(xhr, status, error) {
                // Show error message
                alert('Failed to delete Staff Salary Data.');

                // Log the error to the console
                console.error(error);
              }
            });
          }
        }
    </script>
    <script>
      function DeleteMonthlyReports(id, month) {
        if (confirm("Are you sure you want to delete?")) {
          $.ajax({
            type: 'get',
            url: '{{ route('monthly_reports.delete', ['id' => ':id', 'month' => ':month']) }}'
                    .replace(':id', id)
                    .replace(':month', month),
            success: function(data) {
              alert('Payroll Generation deleted successfully.');
              window.location.reload();
            },
            error: function(xhr, status, error) {
              alert('Failed to delete Payroll Generation.');
              console.error(error);
            }
          });
        }
      }
    </script>
    <script>
        function DeleteWorkingDays(value) {
          if (confirm("Are you sure you want to delete?")) {
            $.ajax({
              type: 'get',
              url: '{{ route('working_days.delete') }}',
              data: { id: value },
              success: function(data) {
                // Show success message
                alert('Monthly Working Days deleted successfully.');

                // Reload the current page
                window.location.reload();
              },
              error: function(xhr, status, error) {
                // Show error message
                alert('Failed to delete Monthly Working Days.');

                // Log the error to the console
                console.error(error);
              }
            });
          }
        }
    </script>
<script>
  document.addEventListener('DOMContentLoaded', () => {
    $('.alert').alert()
  })
</script>
<script>
      history.pushState(null, null, location.href);
    window.onpopstate = function () {
        history.go(1);
    };</script>
</body>
</html>