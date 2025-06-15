<div class="tab-pane" id="product-tab-additional">
    <ul class="list-none">
        @foreach($product->specifications as $spec)
        <li><label>{{$spec->name}}:</label>
            <p>{{ $spec->details}}</p>
        </li>
        @endforeach
    </ul>
</div>