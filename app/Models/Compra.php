<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Compra extends Model
{
    protected $fillable = ['nombre_comprador', 'producto_id', 'cantidad'];
    protected $appends = ['total'];

    public function producto()
    {
        return $this->belongsTo(Producto::class);
    }
    public function total(){
        return $this->cantidad * $this->producto->precio;
    }
}
