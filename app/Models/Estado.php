<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Estado extends Model
{
    use HasFactory;

    protected $fillable = ['sigla', 'nome'];

    public function cidades()
    {
        return $this->hasMany(Cidade::class);
    }
    
    public function scopeFiltrar($query, $filtros)
    {
        if (!empty($filtros['nome'])) {
            $query->where('nome', 'like', '%' . $filtros['nome'] . '%');
        }

        if (!empty($filtros['sigla'])) {
            $query->where('sigla', 'like', '%' . $filtros['sigla'] . '%');
        }

        return $query;
    }

}
