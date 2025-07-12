<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Representante extends Model
{
    use HasFactory;

    protected $fillable = [
        'nome',
        'tipo',
        'documento',
        'email',
        'telefone',
    ];

    public function cidades()
    {
        return $this->belongsToMany(Cidade::class, 'representante_cidade');
    }


    public function scopeFiltrar($query, $filtros)
    {
        if (!empty($filtros['nome'])) {
            $query->where('nome', 'like', '%' . $filtros['nome'] . '%');
        }

        if (!empty($filtros['tipo'])) {
            $query->where('tipo', $filtros['tipo']);
        }

        if (!empty($filtros['cidade_id'])) {
            $query->whereHas('cidades', function ($q) use ($filtros) {
                $q->where('cidades.id', $filtros['cidade_id']);
            });
        }
        if (!empty($filtros['documento'])) {
            $query->where('documento', 'like', '%' . $filtros['documento'] . '%');
        }
        if (!empty($filtros['email'])) {
            $query->where('email', 'like', '%' . $filtros['email'] . '%');
        }
        if (!empty($filtros['telefone'])) {
            $query->where('telefone', 'like', '%' . $filtros['telefone'] . '%');
        }


        return $query;
    }
}
