<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('home');
});

Route::get('/clientes', function () {
    return view('clientes');
});

Route::get('/cidades', function () {
    return view('cidades');
});

Route::get('/estados', function () {
    return view('estados');
});

Route::get('/representantes', function () {
    return view('representantes');
});