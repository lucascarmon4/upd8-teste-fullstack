<?php

namespace App\Http\Controllers;

use App\Models\Representante;
use Illuminate\Http\Request;

class RepresentanteController extends Controller
{
    public function index(Request $request)
    {
        return Representante::with('cidades.estado')
            ->filtrar($request->only(['nome', 'tipo', 'cidade_id']))
            ->paginate(10);
    }

    public function all()
    {
        return Representante::with('cidades.estado')->get();
    }

    public function store(Request $request)
    {
        $dados = $request->validate([
            'nome'        => 'required|string|max:100',
            'tipo'        => 'required|in:PF,PJ',
            'documento'   => 'required|string|max:20|unique:representantes,documento',
            'email'       => 'nullable|email|max:100',
            'telefone'    => 'nullable|string|max:20',
            'cidade_ids'  => 'required|array',
            'cidade_ids.*'=> 'exists:cidades,id',
        ]);

        $representante = Representante::create($dados);
        $representante->cidades()->sync($dados['cidade_ids']);

        return response()->json($representante->load('cidades.estado'), 201);
    }

    public function show(Representante $representante)
    {
        return $representante->load('cidades.estado');
    }

    public function update(Request $request, Representante $representante)
    {
        $dados = $request->validate([
            'nome'        => 'sometimes|string|max:100',
            'tipo'        => 'sometimes|in:PF,PJ',
            'documento'   => 'sometimes|string|max:20|unique:representantes,documento,' . $representante->id,
            'email'       => 'nullable|email|max:100',
            'telefone'    => 'nullable|string|max:20',
            'cidade_ids'  => 'sometimes|array',
            'cidade_ids.*'=> 'exists:cidades,id',
        ]);

        $representante->update($request->only([
            'nome', 'tipo', 'documento', 'email', 'telefone'
        ]));

        if (isset($dados['cidade_ids'])) {
            $representante->cidades()->sync($dados['cidade_ids']);
        }

        return response()->json($representante->load('cidades.estado'));
    }

    public function destroy(Representante $representante)
    {
        $representante->delete();
        return response()->json(null, 204);
    }
}
