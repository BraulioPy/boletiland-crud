<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Producto extends Model
{
    use SoftDeletes; //Activo el SoftDelete que importe arriba
    protected $fillable = ['nombre', 'precio'];
    
    public function compras()
    {
        return $this->hasMany(Compra::class);
    }
}
