<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreCompraRequest;
use App\Http\Requests\UpdateCompraRequest;
use App\Models\Compra;
use Illuminate\Http\Request;

class CompraController extends Controller
{

    public function index()
    {
        return response()->json(Compra::with('producto')->get(),200);
    }

    public function store(StoreCompraRequest $request)
    {
        $compra = Compra::create($request->validated());
        return response()->json($compra->load('producto'),201);
    }

    public function show(int $id)
    {
        $compra = Compra::find($id);
        if(!$compra){
            return response()->json(['mensaje'=>'No se ha realizado ninguna compra con esa id todavía o se eliminó']);
        }
        return response()->json($compra,200);
    }

    public function update(UpdateCompraRequest $request, int $id)
    {
        $compra = Compra::find($id);
        if(!$compra){
            return response()->json(['mensaje'=>'No se puede actualizar los datos de una compra que no existe o hubo un error'],404);
        }
        $compra->update($request->validated());
        return response()->json($compra->load('producto'),200);
    }

    public function destroy(int $id)
    {
        $compra = Compra::find($id);
        if(!$compra){
            return response()->json(['mensaje' => 'No se ha podido eliminar la compra ya que no existe!'], 404);
        }
        $compra->delete();
        return response()->json(['mensaje'=> 'Se ha eliminado correctamente la compra'],200);
    }
}
