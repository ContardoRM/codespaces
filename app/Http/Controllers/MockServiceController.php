<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MockServiceController extends Controller
{
    public function index()
    {
        return response()->json([
            'status'  => 'success',
            'message' => 'Este es un servicio mockeado',
            'data'    => [
                'nombre'    => 'Ejemplo',
                'valor'     => 123,
                'timestamp' => now()->toDateTimeString()
            ]
        ]);
    }
}
