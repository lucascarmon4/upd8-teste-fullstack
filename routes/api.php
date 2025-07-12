<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ClienteController;
use App\Http\Controllers\CidadeController;
use App\Http\Controllers\EstadoController;
use App\Http\Controllers\RepresentanteController;

// Rotas de API para o recurso Cliente
Route::apiResource('clientes', ClienteController::class);

// Rotas de API para o recurso Cidade
Route::get('cidades/all', [CidadeController::class, 'all']);
Route::apiResource('cidades', CidadeController::class);

// Rotas de API para o recurso de Estado
Route::get('estados/all', [EstadoController::class, 'all']);
Route::apiResource('estados', EstadoController::class);

// Rotas de API para o recurso Representante
Route::get('representantes/all', [RepresentanteController::class, 'all']);
Route::apiResource('representantes', RepresentanteController::class);