const apiBase = "/api";
let paginaAtual = 1;
let ultimaPagina = 1;
let cidadeEmEdicao = null;

async function carregarEstados() {
    const res = await axios.get(`${apiBase}/estados/all`);
    const selectEstado = document.getElementById("estado_id");
    const filtroEstado = document.getElementById("filtro-estado");

    res.data.forEach((estado) => {
        const option1 = document.createElement("option");
        option1.value = estado.id;
        option1.textContent = `${estado.nome} (${estado.sigla})`;
        selectEstado.appendChild(option1);

        const option2 = document.createElement("option");
        option2.value = estado.id;
        option2.textContent = `${estado.nome} (${estado.sigla})`;
        filtroEstado.appendChild(option2);
    });
}

async function carregarCidades(pagina = 1) {
    const tbody = document.getElementById("tabela-cidades");
    tbody.innerHTML = `<tr><td colspan="3" class="text-center py-3">Carregando...</td></tr>`;

    const params = {
        page: pagina,
        nome: document.getElementById("filtro-nome").value,
        estado_id: document.getElementById("filtro-estado").value,
    };

    try {
        const res = await axios.get(`${apiBase}/cidades`, { params });
        tbody.innerHTML = "";

        if (!res.data.data || res.data.data.length === 0) {
            tbody.innerHTML = `<tr><td colspan="3" class="text-center py-3">Nenhuma cidade encontrada.</td></tr>`;
            return;
        }

        res.data.data.forEach((cidade) => adicionarCidadeNaTabela(cidade));

        paginaAtual = res.data.current_page;
        ultimaPagina = res.data.last_page;

        document.getElementById("btn-anterior").disabled =
            res.data.prev_page_url === null;
        document.getElementById("btn-proxima").disabled =
            res.data.next_page_url === null;
        document.getElementById("btn-primeira").disabled = paginaAtual === 1;
        document.getElementById("btn-ultima").disabled =
            paginaAtual === ultimaPagina;

        document.getElementById(
            "info-paginacao"
        ).textContent = `Página ${paginaAtual} de ${ultimaPagina} — Total: ${res.data.total} cidades`;
    } catch (erro) {
        console.error(erro);
        tbody.innerHTML = `<tr><td colspan="3" class="text-center py-3 text-red-600">Erro ao carregar cidades.</td></tr>`;
    }
}

function adicionarCidadeNaTabela(cidade) {
    const tbody = document.getElementById("tabela-cidades");

    const tr = document.createElement("tr");
    tr.innerHTML = `
        <td class="border px-2 py-1">${cidade.nome}</td>
        <td class="border px-2 py-1">${cidade.estado.sigla}</td>
        <td class="border px-2 py-1 text-center space-x-2">
            <button onclick="editarCidade(${cidade.id})" class="bg-yellow-500 text-white px-2 py-1 rounded hover:bg-yellow-600 text-sm">Editar</button>
            <button onclick="excluirCidade(${cidade.id})" class="bg-red-500 text-white px-2 py-1 rounded hover:bg-red-600 text-sm">Excluir</button>
        </td>
    `;
    tbody.appendChild(tr);
}

async function excluirCidade(id) {
    if (confirm("Tem certeza que deseja excluir esta cidade?")) {
        await axios.delete(`${apiBase}/cidades/${id}`);
        carregarCidades(paginaAtual);
    }
}

async function editarCidade(id) {
    const res = await axios.get(`${apiBase}/cidades/${id}`);
    const cidade = res.data;

    document.getElementById("cidade_id").value = cidade.id;
    document.getElementById("nome").value = cidade.nome;
    document.getElementById("estado_id").value = cidade.estado_id;
    cidadeEmEdicao = id;

    atualizarTituloFormulario();
    document.getElementById("btn-submit").textContent = "Atualizar Cidade";
    mostrarFormulario();
}

function mostrarFormulario() {
    document.getElementById("form-container").classList.remove("hidden");
    atualizarTituloFormulario();
}

function fecharFormulario() {
    document.getElementById("form-container").classList.add("hidden");
    document.getElementById("form-cidade").reset();
    cidadeEmEdicao = null;
    document.getElementById("btn-submit").textContent = "Salvar Cidade";
    atualizarTituloFormulario();
}

function atualizarTituloFormulario() {
    const titulo = document.querySelector("#form-container h2");
    titulo.textContent = cidadeEmEdicao ? "Editar Cidade" : "Nova Cidade";
}

document.addEventListener("DOMContentLoaded", () => {
    document
        .getElementById("form-filtro")
        .addEventListener("submit", function (e) {
            e.preventDefault();
            carregarCidades(1);
        });

    document
        .getElementById("form-cidade")
        .addEventListener("submit", async function (e) {
            e.preventDefault();
            const dados = {
                nome: document.getElementById("nome").value,
                estado_id: document.getElementById("estado_id").value,
            };

            try {
                if (cidadeEmEdicao) {
                    await axios.put(
                        `${apiBase}/cidades/${cidadeEmEdicao}`,
                        dados
                    );
                } else {
                    await axios.post(`${apiBase}/cidades`, dados);
                }
                fecharFormulario();
                carregarCidades(paginaAtual);
            } catch (erro) {
                alert("Erro ao salvar cidade.");
                console.error(erro);
            }
        });

    carregarEstados();
    carregarCidades();
});
