<?php

namespace App\Http\Controllers;

use App\Models\Estado;
use Illuminate\Http\Request;

class EstadoController extends Controller
{
    public function index(Request $request)
    {
        return Estado::filtrar($request->only(['nome', 'sigla']))
            ->paginate(15);
    }   

    public function all()
    {
        return Estado::all();
    }

    public function store(Request $request)
    {
        $dados = $request->validate([
            'nome' => 'required|string|max:100',
            'sigla' => 'required|string|size:2|unique:estados,sigla',
        ]);

        $estado = Estado::create($dados);
        return response()->json($estado, 201);
    }

    public function show(Estado $estado)
    {
        return $estado;
    }

    public function update(Request $request, Estado $estado)
    {
        $dados = $request->validate([
            'nome' => 'sometimes|string|max:100',
            'sigla' => 'sometimes|string|size:2|unique:estados,sigla,' . $estado->id,
        ]);

        $estado->update($dados);
        return response()->json($estado);
    }

    public function destroy(Estado $estado)
    {
        $estado->delete();
        return response()->json(null, 204);
    }
}