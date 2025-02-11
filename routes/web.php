<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MockServiceController;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/mock', [MockServiceController::class, 'index']);
