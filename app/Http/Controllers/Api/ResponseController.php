<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ResponseController extends Controller
{
    public function sendResponse($data, $message = '', $code = 200, $type)
    {
        $response = [];
        switch($type){
            case 'send-data':
                $response = [
                    'status' => 'success',
                    'message' => $message,
                    'code' => $code,
                    'data' => $data
                ];
            break;
            case 'send-response':
                $response = [
                    'status' => 'success',
                    'message' => $message,
                    'code' => $code
                ];
            break;
	        case 'send-error':
                $response = [
                    'status' => 'error',
                    'message' => $message,
                    'code' => $code
                ];
            break;
            default:
        }

        return response()->json($response);
    }



    public function sendError($error, $code = 404)
    {
    	$response = [
            'error' => $error,
        ];
        return response()->json($response, $code);
    }
}
