<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class GoogleMapController extends ResponseController
{
    public function getDirections(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'origin' => 'required|string',
            'destination' => 'required|string'
        ]);

        if($validator->fails()){
            $error = $validator->errors()->first();
            return $this->sendResponse('Error', $error, 404, 'send-error');
        }

        $key = config('app.google_map_api_key');
        $origin = urlencode($request->origin);
        $destination = urlencode($request->destination);

        $url = 'https://maps.googleapis.com/maps/api/directions/json?origin='.$origin.'&destination='.$destination.'&key='.$key;
        
        $data = json_decode(file_get_contents($url), true);
        
        return $this->sendResponse($data, 'Google Map Direction Api Runs Successfully.', 200, 'send-data');
    }
}
