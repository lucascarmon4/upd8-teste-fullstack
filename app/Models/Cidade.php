<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Cidade extends Model
{
    use HasFactory;

    protected $fillable = ['nome', 'estado_id'];

    public function estado()
    {
        return $this->belongsTo(Estado::class);
    }

    public function clientes()
    {
        return $this->hasMany(Cliente::class);
    }

    public function representantes()
    {
        return $this->belongsToMany(Representante::class, 'representante_cidade');
    }

    /**
     * 
     * Filtra as cidades com base nos parâmetros fornecidos.
     *
    **/
    public function scopeFiltrar($query, $filtros)
    {
        if (!empty($filtros['nome'])) {
            $query->where('nome', 'like', '%' . $filtros['nome'] . '%');
        }

        if (!empty($filtros['estado_id'])) {
            $query->where('estado_id', $filtros['estado_id']);
        }

        return $query;
    }
}
