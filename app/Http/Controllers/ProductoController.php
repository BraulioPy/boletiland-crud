<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreProductoRequest;
use App\Http\Requests\UpdateProductoRequest;
use App\Models\Producto;
use Illuminate\Http\Request;

class ProductoController extends Controller
{
    public function index(Request $request)
    {
        $busqueda = $request->query('busqueda');
        $productos = Producto::when($busqueda, function($query) use ($busqueda) {
            $query->where('nombre', 'LIKE', "%{$busqueda}%")
            ->orWhere('precio', 'LIKE', "%{$busqueda}%")
            ->orWhere('id', 'LIKE', "%{$busqueda}%");
        })->orderBy('nombre','asc')->orderBy('id', 'asc')->paginate(6);
        return response()->json($productos, 200);
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
        return response()->json($producto,200);
    }

    public function update(UpdateProductoRequest $request, int $id)
    {
        $producto = Producto::find($id);
        if(!$producto){
            return response()->json(['mensaje' => 'El producto que intentas actualizar no existe o hubo un error al localizarlo'], 404);
        }
        $producto->update($request->validated());
        return response()->json($producto,200);
    }

    public function destroy(int $id)
    {
        $producto = Producto::find($id);
        if(!$producto){
            return response()->json(['mensaje'=>'No se puede borrar un producto que no existe o no se ha podido encontrar'],404);
        }
        $producto->delete();
        return response()->json(['mensaje'=>'Producto eliminado correctamente!'],200);
    }
}
