<?php

namespace App\Http\Controllers;

use App\Models\Cidade;
use Illuminate\Http\Request;

class CidadeController extends Controller
{
    public function index(Request $request)
    {
        return Cidade::with('estado')
            ->filtrar($request->only(['nome', 'estado_id']))
            ->paginate(15);
    }

    public function all()
    {
        return Cidade::with('estado')->get();
    }

    public function store(Request $request)
    {
        $dados = $request->validate([
            'nome'      => 'required|string|max:100',
            'estado_id' => 'required|exists:estados,id',
        ]);

        $cidade = Cidade::create($dados);
        return response()->json($cidade->load('estado'), 201);
    }

    public function show(Cidade $cidade)
    {
        return $cidade->load('estado');
    }

    public function update(Request $request, Cidade $cidade)
    {
        $dados = $request->validate([
            'nome'      => 'sometimes|string|max:100',
            'estado_id' => 'sometimes|exists:estados,id',
        ]);

        $cidade->update($dados);
        return response()->json($cidade->load('estado'));
    }

    public function destroy(Cidade $cidade)
    {
        $cidade->delete();
        return response()->json(null, 204);
    }
}