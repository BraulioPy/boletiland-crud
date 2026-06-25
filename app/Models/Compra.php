<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;;
use Illuminate\Database\Eloquent\Model;

class Compra extends Model
{
    protected $fillable = ['nombre_comprador', 'producto_id', 'cantidad'];
    protected $appends = ['total'];

    public function producto()
    {
        return $this->belongsTo(Producto::class)->withTrashed();
    }
    public function getTotalAttribute()
    {
        return $this->cantidad * ($this->producto?->precio ?? 0);
    }
}
