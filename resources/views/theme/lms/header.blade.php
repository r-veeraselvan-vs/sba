<style type="text/css">
    .badge-notify{
   background:red;
   position:relative;
    top: -10px;
    left: -9px;
  }
</style>

 
<div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="{{url('/')}}">Madural Kadai</a>
</div>
<!-- /.navbar-header -->

<ul class="nav navbar-top-links navbar-right">
 
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="fa fa-user fa-fw"></i> {{Auth::user()->name}} <i class="fa fa-caret-down"></i>
        </a>
        <ul class="dropdown-menu dropdown-user">
            <li><a href="#"><i class="fa fa-user fa-fw"></i> Profile</a>
            </li>
            @if(Auth::user()->type=='admin')
            <li><a href="{{ route('register') }}"><i class="fa fa-user fa-fw"></i> Add Admin</a>
            </li>
            @endif
            <li class="divider"></li>
            <li><a href="{{ route('logout') }}"
                                    onclick="event.preventDefault();
                                             document.getElementById('logout-form').submit();"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">{{ csrf_field() }}</form>
            </li>
        </ul>
        <!-- /.dropdown-user -->
    </li>
  
   
    <!-- /.dropdown -->

</ul>
<!-- /.navbar-top-links -->