<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreProductoRequest;
use App\Http\Requests\UpdateProductoRequest;
use App\Models\Producto;
use Illuminate\Http\Request;

class ProductoController extends Controller
{
    public function index()
    {
        return response()->json(Producto::all());
    }


    public function store(StoreProductoRequest $request)
    {
        $producto = Producto::create($request->validated());
        return response()->json($producto, 201);
    }

    public function show(int $id)
    {
        $producto = Producto::find($id);
        if (!$producto) {
            return response()->json(['message' => 'El producto no existe o hubo un error al buscarlo'], 404);
        }
        return response()->json($producto);
    }

    public function update(UpdateProductoRequest $request, int $id)
    {
        $producto = Producto::find($id);
        if(!$producto){
            return response()->json()
        }
    }

    public function destroy(string $id)
    {
        //
    }
}
