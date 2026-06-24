<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class UpdateCompraRequest extends FormRequest
{

    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'nombre_comprador' => 'required|string|max:255',
            'producto_id' => 'required|exists:productos,id',
            'cantidad'         => 'required|integer|min:1',
        ];
    }
}
