<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Representantes</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="/js/representantes.js"></script>
</head>
<body class="bg-gray-100 p-6">
    <div class="max-w-6xl mx-auto bg-white p-6 rounded shadow">
        <div class="mb-4">
            <a href="/" class="inline-block bg-gray-600 text-white px-4 py-2 rounded hover:bg-gray-700 text-sm">
                ← Voltar ao Início
            </a>
        </div>
        <h1 class="text-2xl font-bold mb-4">Representantes</h1>
        <!-- FILTRO -->
        <form id="form-filtro" class="grid grid-cols-1 md:grid-cols-6 gap-4 mb-6">
            <input type="text" id="filtro-nome" placeholder="Nome" class="border p-2 rounded">
            
            <select id="filtro-tipo" class="border p-2 rounded">
                <option value="">Tipo</option>
                <option value="PF">PF</option>
                <option value="PJ">PJ</option>
            </select>

            <input type="text" id="filtro-documento" placeholder="Documento" class="border p-2 rounded">
            <input type="text" id="filtro-email" placeholder="Email" class="border p-2 rounded">
            <input type="text" id="filtro-telefone" placeholder="Telefone" class="border p-2 rounded">

            <select id="filtro-cidade" class="border p-2 rounded">
                <option value="">Cidade</option>
            </select>

            <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 md:col-span-6">
                Filtrar
            </button>
        </form>


        <!-- BOTÃO MOSTRAR FORM -->
        <div class="flex justify-end mb-4">
            <button onclick="mostrarFormulario()" class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700">
                Novo Representante
            </button>
        </div>

        <!-- FORMULÁRIO OCULTO -->
        <div id="form-container" class="mb-6 hidden">
            <h2 class="text-xl font-semibold mb-2">Novo Representante</h2>
            <form id="form-representante" class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <input type="text" id="nome" placeholder="Nome" class="border p-2 rounded" required>
                
                <select id="tipo" class="border p-2 rounded" required>
                    <option value="">Tipo</option>
                    <option value="PF">Pessoa Física</option>
                    <option value="PJ">Pessoa Jurídica</option>
                </select>

                <input type="text" id="documento" placeholder="CPF ou CNPJ" class="border p-2 rounded" required>
                <input type="email" id="email" placeholder="Email" class="border p-2 rounded">
                <input type="text" id="telefone" placeholder="Telefone" class="border p-2 rounded">

                <select id="cidade_ids" class="border p-2 rounded col-span-2" multiple required></select>

                <div class="col-span-2 flex justify-between items-center">
                    <button type="submit" id="btn-submit" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">
                        Salvar Representante
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
                    <th class="border px-2 py-1">Tipo</th>
                    <th class="border px-2 py-1">Documento</th>
                    <th class="border px-2 py-1">Email</th>
                    <th class="border px-2 py-1">Telefone</th>
                    <th class="border px-2 py-1">Cidades Atendidas</th>
                    <th class="border px-2 py-1">Ações</th>
                </tr>
            </thead>
            <tbody id="tabela-representantes">
                <tr><td colspan="7" class="text-center py-3">Carregando...</td></tr>
            </tbody>
        </table>

        <!-- PAGINAÇÃO -->
        <div class="flex flex-col md:flex-row md:justify-between items-center mt-4 space-y-2 md:space-y-0">
            <div id="info-paginacao" class="text-sm text-gray-600">Página 1 de 1 — Total: 0 representantes</div>
            <div class="flex space-x-2">
                <button onclick="carregarRepresentantes(1)" id="btn-primeira" class="bg-gray-200 px-3 py-1 rounded hover:bg-gray-300 text-sm">Primeira</button>
                <button onclick="carregarRepresentantes(paginaAtual - 1)" id="btn-anterior" class="bg-gray-300 px-3 py-1 rounded hover:bg-gray-400 text-sm">Anterior</button>
                <button onclick="carregarRepresentantes(paginaAtual + 1)" id="btn-proxima" class="bg-gray-300 px-3 py-1 rounded hover:bg-gray-400 text-sm">Próxima</button>
                <button onclick="carregarRepresentantes(ultimaPagina)" id="btn-ultima" class="bg-gray-200 px-3 py-1 rounded hover:bg-gray-300 text-sm">Última</button>
            </div>
        </div>
    </div>
</body>
</html>
