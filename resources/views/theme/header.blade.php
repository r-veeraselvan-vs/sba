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
    <a class="navbar-brand" href="{{url('/')}}">Shri Balaji agencies</a>
</div>
<!-- /.navbar-header -->

<ul class="nav navbar-top-links navbar-right">
 
 
   <li>
            <a role="button" href="{{ route('user.logout') }}"
                onclick="event.preventDefault();
                document.getElementById('logout-form').submit();">
                <i class="fa fa-sign-out fa-fw"> Back</i>
            </a>
        </li>
        <form id="logout-form" action="{{ route('user.logout') }}" method="POST" class="d-none">
            @csrf
        </form>

</ul>
<!-- /.navbar-top-links -->