<div class="tab-pane @if(Session::get('tab') != 'review') active in @endif" id="feature">
    <ul class="list-none">
        @foreach($product->features as $feat)
        <li><label>{{$feat->feature}}</label></li>
        @endforeach
    </ul>
</div>