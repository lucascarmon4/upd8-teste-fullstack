<?php

namespace App\Http\Controllers;

use App\Models\Cliente;
use Illuminate\Http\Request;

class ClienteController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        return Cliente::with('cidade.estado')
            ->filtrar($request->only(['nome', 'sexo', 'cidade_id']))
            ->paginate(10);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $dados = $request->validate([
            'nome'            => 'required|string|max:100',
            'cpf'             => 'required|string|max:14|unique:clientes,cpf',
            'data_nascimento' => 'required|date|before:today',
            'sexo'            => 'required|in:M,F',
            'cidade_id'       => 'required|exists:cidades,id',
        ]);

        $cliente = Cliente::create($dados);

        return response()->json($cliente, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Cliente $cliente)
    {
        return $cliente->load('cidade.estado');
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Cliente $cliente)
    {
        $dados = $request->validate([
            'nome'            => 'sometimes|string|max:100',
            'cpf'             => 'sometimes|string|max:14|unique:clientes,cpf,' . $cliente->id,
            'data_nascimento' => 'sometimes|date|before:today',
            'sexo'            => 'sometimes|in:M,F',
            'cidade_id'       => 'sometimes|exists:cidades,id',
        ]);

        $cliente->update($dados);

        return response()->json($cliente);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Cliente $cliente)
    {
        $cliente->delete();

        return response()->json(null, 204);
    }
}
