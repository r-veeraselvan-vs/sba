<ul class="nav nav-tabs mb-4" role="tablist">
    <li class="nav-item">
        <a class="@if(request()->segment(2) == 'profile') nav-link active @endif" href="{{ route('customer.profile') }}">My Profile</a>
    </li>
    <li class="nav-item">
        <a class="@if(request()->segment(2) == 'orders' || request()->segment(2) == 'orderdetails') nav-link active @endif" href="{{ route('customer.orders') }}">My Orders</a>
    </li>
    <li class="nav-item">
        <a class="@if(request()->segment(2) == 'wishlist') nav-link active @endif" href="{{ route('customer.wishlist') }}">My Wishlist</a>
    </li>
    <li class="nav-item">
        <a class="@if(request()->segment(2) == 'my-address') nav-link active @endif" href="{{ route('customer.address') }}">My Addresses</a>
    </li>
    <li class="nav-item">
        <a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">Logout</a>
    </li>
</ul>
<form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
    @csrf
</form>

<script>
    function hitUrl(url){
        window.location = url;
    }
</script>