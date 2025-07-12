<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Cidades</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="/js/cidades.js"></script>
</head>
<body class="bg-gray-100 p-6">
    <div class="max-w-4xl mx-auto bg-white p-6 rounded shadow">
        <div class="mb-4">
            <a href="/" class="inline-block bg-gray-600 text-white px-4 py-2 rounded hover:bg-gray-700 text-sm">
                ← Voltar ao Início
            </a>
        </div>
        <h1 class="text-2xl font-bold mb-4">Cidades</h1>

        <!-- FILTRO -->
        <form id="form-filtro" class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-4">
            <input type="text" id="filtro-nome" placeholder="Nome da cidade" class="border p-2 rounded">
            <select id="filtro-estado" class="border p-2 rounded">
                <option value="">Estado</option>
            </select>
            <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">Filtrar</button>
        </form>

        <!-- BOTÃO MOSTRAR FORM -->
        <div class="flex justify-end mb-4">
            <button onclick="mostrarFormulario()" class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700">
                Nova Cidade
            </button>
        </div>

        <!-- FORMULÁRIO OCULTO -->
        <div id="form-container" class="mb-6 hidden">
            <h2 class="text-xl font-semibold mb-2">Nova Cidade</h2>
            <form id="form-cidade" class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <input type="hidden" id="cidade_id">
                <input type="text" id="nome" placeholder="Nome da cidade" class="border p-2 rounded" required>
                <select id="estado_id" class="border p-2 rounded" required>
                    <option value="">Selecione o estado</option>
                </select>
                <div class="col-span-2 flex justify-between items-center">
                    <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700" id="btn-submit">
                        Salvar Cidade
                    </button>
                    <button type="button" onclick="fecharFormulario()" class="text-red-600 hover:underline text-sm">Cancelar</button>
                </div>
            </form>
        </div>

        <!-- TABELA -->
        <table class="w-full border-collapse text-sm">
            <thead>
                <tr class="bg-gray-200">
                    <th class="border px-2 py-1">Nome</th>
                    <th class="border px-2 py-1">Estado</th>
                    <th class="border px-2 py-1 text-center">Ações</th>
                </tr>
            </thead>
            <tbody id="tabela-cidades">
                <tr><td colspan="3" class="text-center py-3">Carregando...</td></tr>
            </tbody>
        </table>

        <!-- PAGINAÇÃO -->
        <div class="flex flex-col md:flex-row md:justify-between items-center mt-4 space-y-2 md:space-y-0">
            <div id="info-paginacao" class="text-sm text-gray-600">Página 1 de 1 — Total: 0 cidades</div>
            <div class="flex space-x-2">
                <button onclick="carregarCidades(1)" id="btn-primeira" class="bg-gray-200 px-3 py-1 rounded hover:bg-gray-300 text-sm">Primeira</button>
                <button onclick="carregarCidades(paginaAtual - 1)" id="btn-anterior" class="bg-gray-300 px-3 py-1 rounded hover:bg-gray-400 text-sm" disabled>Anterior</button>
                <button onclick="carregarCidades(paginaAtual + 1)" id="btn-proxima" class="bg-gray-300 px-3 py-1 rounded hover:bg-gray-400 text-sm">Próxima</button>
                <button onclick="carregarCidades(ultimaPagina)" id="btn-ultima" class="bg-gray-200 px-3 py-1 rounded hover:bg-gray-300 text-sm">Última</button>
            </div>
        </div>
    </div>
</body>
</html>
