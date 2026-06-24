<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class StoreProductoRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true; //no tenemos autenticacion entonces 
    }

    public function rules(): array
    {
        return [
            //
        ];
    }
}
