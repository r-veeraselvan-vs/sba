<form action="{{ route('customer.address.update') }}" method="post" class="form">
    <h5>Edit Address</h5>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="http://maps.google.com/maps/api/js?key={{ config('app.google_map_customer_api_key') }}&libraries=places"></script>
   
                    <style>
                        /* map */
                        #map_canvas {         
                            height: 200px;         
                            width: 100%;         
                            margin: 0.6em;       
                        }
                        /* map */
                        .account .form-control {
                            color: #434242 !important;
                        }
                        .form-control::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
                            color: #cbcdd0;
                            opacity: 1; /* Firefox */
                        }

                        .form-control:-ms-input-placeholder { /* Internet Explorer 10-11 */
                            color: #cbcdd0;
                        }

                        .form-control::-ms-input-placeholder { /* Microsoft Edge */
                            color: #cbcdd0;
                        }
                    </style>



    <div class="row">
        <div class="col-md-6">
            <div>
                <div>
                    <label>Search Address *</label>
                    <input type="text" class="form-control"  onchange="onAddressChange()" name="address" id="searchAddress" value="{{ $address->address }}" required>
                </div> 
                <div>
                    <label>Door No./Apartment *</label>
                    <input type="text" class="form-control" required name="building_name" id="building_name" value="{{ $address->building_name }}" >
                </div>
            </div>           
            <div>
                <label>City *</label>
                <input type="text" class="form-control" name="city" id="city" value="{{ $address->city }}" required="">
            </div>
        </div>
        <div class="col-md-6"> 
            <div>
                <label>Save As *</label>
                <input type="text" class="form-control" name="short_name" required id="short_name" placeholder="ie: Home, Office, etc..." value="{{ $address->short_name }}">
            </div>
            <div>
                <label>Route / Landmark</label>
                <input type="text" class="form-control" name="route" id="route" value="{{ $address->route }}">
            </div>
            <div>
                <label>Post Code *</label>
                <input type="number" class="form-control" name="postcode" id="postal_code" value="{{ $address->postcode }}" required>
            </div>
            <input type="hidden" name="type" value="{{ $type }}">
            <input type="hidden" name="id" value="{{ $address->id }}">
            <input type="hidden" name="latitude" id="latitude" value="{{ $address->latitude }}">  
            <input type="hidden" name="longitude" id="longitude" value="{{ $address->longitude }}">
        </div>
        <div id="map_canvas"></div>
    </div>
    <div class="row">
    <script>
        // $(function() {

        var lat  = "{{ @$address->latitude }}";
        var lng = "{{ @$address->longitude }}";

        var position = latlng = new google.maps.LatLng(lat, lng);
        var image = 'http://www.google.com/intl/en_us/mapfiles/ms/micons/blue-dot.png'; 
        map = new google.maps.Map(document.getElementById("map_canvas"), {
                zoom: 13,
                center: position,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
            });
        marker = new google.maps.Marker({
                position: position,
                map: map,
                icon: image,
                draggable:true
            });

        var infowindow = new google.maps.InfoWindow(); 
        var input = document.getElementById('searchAddress');  
        
        // getPlaces(input, map);

        // function getPlaces(input, map){

        //     var autocomplete = new google.maps.places.Autocomplete(input, {
        //         types: ["geocode", "establishment"]
        //     });
            
        //     autocomplete.setComponentRestrictions({
        //         country: ["in"],
        //     });
            
        //     autocomplete.bindTo('bounds', map); 
            
        
        //     google.maps.event.addListener(autocomplete, 'place_changed', function() {
        //         infowindow.close();
        //         var place = autocomplete.getPlace();
        //         if (place.geometry.viewport) {
        //             map.fitBounds(place.geometry.viewport);
        //         } else {
        //             map.setCenter(place.geometry.location);
        //             map.setZoom(17);  
        //         }

        //         searchAddress(autocomplete);
        //     });  
        // }
        
        // function searchAddress(autocomplete) {
        //     var place = autocomplete.getPlace();
        //     fillAddress(place);
        // }
        
        function moveMarker(placeName, latlng){
            marker.setIcon(image);
            marker.setPosition(latlng);
            infowindow.setContent(placeName);
            infowindow.open(map, marker);
        }

        function fillAddress(place){

            $("#latitude").val('');
            $("#longitude").val('');
            moveMarker(place.formatted_address, place.geometry.location)
            $("#latitude").val(place.geometry.location.lat());
            $("#longitude").val(place.geometry.location.lng());
        }

        var geocoder = new google.maps.Geocoder();

        google.maps.event.addListener(map, 'click', function(event) {
            geocoder.geocode({
                'latLng': event.latLng
            }, function(results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    if (results[0]) {
                        fillAddress(results[0])
                    }
                }
            });
        });

        function handleEvent(event) {
            geocoder.geocode({
                'latLng': event.latLng
            }, function(results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    if (results[0]) {
                        fillAddress(results[0])
                    }
                }
            });
        }

        marker.addListener('drag', handleEvent);
        // marker.addListener('dragend', handleEvent);

        if(lat == null || lat == '' || lat == 0 || lng == null || lng == '' || lng == 0){
            var address = document.getElementById("searchAddress").value;
            geocoder.geocode( { 'address': address}, function(results, status) {
                if (status == google.maps.GeocoderStatus.OK)
                {
                    fillAddress(results[0])
                    }
                });
            }

        
        function onAddressChange(){
            var address = document.getElementById("searchAddress").value;
            geocoder.geocode( { 'address': address}, function(results, status) {
                if (status == google.maps.GeocoderStatus.OK)
                {
                    fillAddress(results[0])
                }
            });
        }

// });


    </script>
    </div>
    <button type="submit" class="btn btn-primary btn-reveal-right">Save Changes <i class="d-icon-arrow-right"></i></button>
</form>
