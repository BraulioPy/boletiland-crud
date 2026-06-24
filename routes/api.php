<?php

use App\Http\Controllers\CompraController;
use App\Http\Controllers\ProductoController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/productos', [ProductoController::class, 'index']);
Route::post('/productos', [ProductoController::class, 'store']);
Route::get('/productos/{id}', [ProductoController::class, 'show']);
Route::put('/productos/{id}', [ProductoController::class, 'update']);
Route::delete('/productos/{id}', [ProductoController::class, 'destroy']);

Route::get('/compras', [CompraController::class, 'index']);
Route::post('/compras', [CompraController::class, 'store']);
Route::get('/compras/{id}', [CompraController::class, 'show']);
Route::put('/compras/{id}', [CompraController::class, 'update']);
Route::delete('/compras/{id}', [CompraController::class, 'destroy']);

// Route::get('/compras/exportar/excel', [CompraController::class, 'exportarExcel']);