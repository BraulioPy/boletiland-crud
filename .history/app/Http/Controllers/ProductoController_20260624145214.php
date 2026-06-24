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
            return response()->json(['mensaje' => 'El producto no existe o hubo un error al buscarlo'], 404);
        }
        return response()->json($producto);
    }

    public function update(UpdateProductoRequest $request, int $id)
    {
        $producto = Producto::find($id);
        if(!$producto){
            return response()->json(['mensaje' => 'El producto que intentas actualizar no existe o hubo un error al localizarlo'], 404);
        }
        $producto->update($request->validated());
        return response()->json($producto);
    }

    public function destroy(int $id)
    {
        $producto = Producto::find($id);
        if(!$producto){
            return response()->json(['mensaje'=>'No se puede borrar un producto que no existe o no se ha podido encontrar'],404);
        }
        $producto->delete();
        return response()->json(['mensaje'])
    }
}
