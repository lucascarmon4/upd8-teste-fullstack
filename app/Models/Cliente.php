<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Cliente extends Model
{
    use HasFactory;

    protected $fillable = [
        'nome',
        'cpf',
        'data_nascimento',
        'sexo',
        'cidade_id',
    ];

    public function cidade()
    {
        return $this->belongsTo(Cidade::class);
    }

    public function scopeFiltrar($query, $filtros) {
        if (isset($filtros['nome']) && !empty($filtros['nome'])) {
            $query->where('nome', 'like', '%' . $filtros['nome'] . '%');
        }

        if (isset($filtros['sexo']) && !empty($filtros['sexo'])) {
            $query->where('sexo', $filtros['sexo']);
        }

        if (isset($filtros['cidade_id']) && !empty($filtros['cidade_id'])) {
            $query->where('cidade_id', $filtros['cidade_id']);
        }

        return $query;
    }
}
