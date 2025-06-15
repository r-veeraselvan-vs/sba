<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    
    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
            <?php 
      $orderNotificationCount = \App\OrderNotifications::where('read_at',null)->count();
      $unreadorderNotifications = \App\OrderNotifications::where('read_at',null)->take(10)->get();

      ?>
      <?php 
function time_since($since) {

$current=Carbon\Carbon::now();

$timeFirst  = strtotime($since);
$timeSecond = strtotime($current);
$differenceInSeconds = $timeSecond - $timeFirst;

    $chunks = array(
        array(60 * 60 * 24 * 365 , 'year'),
        array(60 * 60 * 24 * 30 , 'month'),
        array(60 * 60 * 24 * 7, 'week'),
        array(60 * 60 * 24 , 'day'),
        array(60 * 60 , 'hr'),
        array(60 , 'min'),
        array(1 , 'sec')
    );

    for ($i = 0, $j = count($chunks); $i < $j; $i++) {
        $seconds = $chunks[$i][0];
        $name = $chunks[$i][1];
        if (($count = floor($differenceInSeconds / $seconds)) != 0) {
            break;
        }
    }

    $print = ($count == 1) ? '1 '.$name : "$count {$name}s";
    return $print;
}

?>
        <li class="nav-item dropdown" style="display: none;">
                    <a class="nav-link" data-toggle="dropdown" href="#">
                    <i class="far fa-bell"></i>
                    <span class="badge badge-warning navbar-badge">{{$orderNotificationCount}}</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                    <span class="dropdown-item dropdown-header">{{$orderNotificationCount}} Notifications</span>
                    <span class="dropdown-item dropdown-header text-danger">New / Unread Notifications</span>
  
                         @if(count($unreadorderNotifications)>0)
                                

                              @foreach($unreadorderNotifications as $notification)
                                <div class="dropdown-divider"></div>
                                <a href="{{route('mark-as-read', ['id' => $notification->order_id ])}}" class="dropdown-item" style="background-color:#fbfbfb">
                                <i class="fas fa-envelope mr-2"></i>You have receive new order
            <span class="float-right text-muted text-sm"><?=time_since($notification['updated_at'])?> ago</span>
                                 </a>
            
                             @endforeach

                         @endif
                                 <a href="" class="dropdown-item" style="color: blue">Recent Notifications</a>                
                             @forelse(Auth::user()->readNotifications as $key=>$notification)
                            @if($key<=4)
                                <div class="dropdown-divider"></div>
                                <a href="#" class="dropdown-item">
                                <i class="fas fa-envelope mr-2"></i>You have receive new order
            <span class="float-right text-muted text-sm"><?=time_since($notification['updated_at'])?> ago</span>
                                 </a>
            
                             @else
                                @break
                            @endif
                            @empty
             
                <a href=""  class="dropdown-item">No more notifications!</a>                
             @endforelse
                    
 
        </li>
        <li  class="nav-item" style="margin-right: 50px; display: none;">
            <a class="btn btn-link" role="button" href="{{ route('user.logout') }}"
                onclick="event.preventDefault();
                document.getElementById('logout-form').submit();">
                <i class="fas fa-sign-out-alt"> Logout</i>
            </a>
        </li>
        <form id="logout-form" action="{{ route('user.logout') }}" method="POST" class="d-none">
            @csrf
        </form>
        
    </ul>
  </nav>
  <!-- /.navbar -->