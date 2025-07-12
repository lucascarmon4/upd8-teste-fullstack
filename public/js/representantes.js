const apiBase = "/api";
let paginaAtual = 1;
let ultimaPagina = 1;
let representanteEmEdicao = null;

function atualizarTituloFormulario() {
    const titulo = document.querySelector("#form-container h2");
    const botao = document.getElementById("btn-submit");
    if (representanteEmEdicao) {
        titulo.textContent = "Editar Representante";
        botao.textContent = "Atualizar Representante";
    } else {
        titulo.textContent = "Novo Representante";
        botao.textContent = "Salvar Representante";
    }
}

function mostrarFormulario() {
    document.getElementById("form-container").classList.remove("hidden");
    atualizarTituloFormulario();
}

function fecharFormulario() {
    document.getElementById("form-container").classList.add("hidden");
    document.getElementById("form-representante").reset();
    representanteEmEdicao = null;
    atualizarTituloFormulario();
}

async function carregarCidades() {
    const res = await axios.get(`${apiBase}/cidades/all`);
    const selectCidade = document.getElementById("cidade_ids");
    const filtroCidade = document.getElementById("filtro-cidade");
    res.data.forEach((cidade) => {
        const option1 = document.createElement("option");
        option1.value = cidade.id;
        option1.textContent = `${cidade.nome} - ${cidade.estado.sigla}`;
        selectCidade.appendChild(option1);

        const option2 = document.createElement("option");
        option2.value = cidade.id;
        option2.textContent = `${cidade.nome} - ${cidade.estado.sigla}`;
        filtroCidade.appendChild(option2);
    });
}

async function carregarRepresentantes(pagina = 1) {
    const tbody = document.getElementById("tabela-representantes");
    tbody.innerHTML = `<tr><td colspan="7" class="text-center py-3">Carregando...</td></tr>`;

    const params = {
        page: pagina,
        nome: document.getElementById("filtro-nome").value,
        tipo: document.getElementById("filtro-tipo").value,
        documento: document.getElementById("filtro-documento").value,
        email: document.getElementById("filtro-email").value,
        telefone: document.getElementById("filtro-telefone").value,
        cidade_id: document.getElementById("filtro-cidade").value,
    };

    try {
        const res = await axios.get(`${apiBase}/representantes`, { params });
        tbody.innerHTML = "";

        if (!res.data.data || res.data.data.length === 0) {
            tbody.innerHTML = `<tr><td colspan="7" class="text-center py-3">Nenhum representante encontrado.</td></tr>`;
            return;
        }

        res.data.data.forEach((rep) => {
            const tr = document.createElement("tr");
            tr.innerHTML = `
                <td class="border px-2 py-1">${rep.nome}</td>
                <td class="border px-2 py-1">${rep.tipo}</td>
                <td class="border px-2 py-1">${rep.documento}</td>
                <td class="border px-2 py-1">${rep.email || "-"}</td>
                <td class="border px-2 py-1">${rep.telefone || "-"}</td>
                <td class="border px-2 py-1">${rep.cidades
                    .map((c) => c.nome)
                    .join(", ")}</td>
                <td class="border px-2 py-1 text-center space-x-2">
                    <button onclick="editarRepresentante(${
                        rep.id
                    })" class="bg-yellow-500 text-white px-2 py-1 rounded hover:bg-yellow-600 text-sm">Editar</button>
                    <button onclick="excluirRepresentante(${
                        rep.id
                    })" class="bg-red-500 text-white px-2 py-1 rounded hover:bg-red-600 text-sm">Excluir</button>
                </td>
            `;
            tbody.appendChild(tr);
        });

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
        ).textContent = `Página ${paginaAtual} de ${ultimaPagina} — Total: ${res.data.total} representantes`;
    } catch (erro) {
        console.error(erro);
        tbody.innerHTML = `<tr><td colspan="7" class="text-center py-3 text-red-600">Erro ao carregar representantes.</td></tr>`;
    }
}

async function excluirRepresentante(id) {
    if (confirm("Tem certeza que deseja excluir este representante?")) {
        await axios.delete(`${apiBase}/representantes/${id}`);
        carregarRepresentantes(paginaAtual);
    }
}

async function editarRepresentante(id) {
    try {
        const res = await axios.get(`${apiBase}/representantes/${id}`);
        const rep = res.data;

        representanteEmEdicao = id;
        document.getElementById("nome").value = rep.nome;
        document.getElementById("tipo").value = rep.tipo;
        document.getElementById("documento").value = rep.documento;
        document.getElementById("email").value = rep.email || "";
        document.getElementById("telefone").value = rep.telefone || "";

        const select = document.getElementById("cidade_ids");
        [...select.options].forEach((option) => {
            option.selected = rep.cidades.some((c) => c.id == option.value);
        });

        atualizarTituloFormulario();
        mostrarFormulario();
    } catch (error) {
        alert("Erro ao carregar representante para edição.");
        console.error(error);
    }
}

document.addEventListener("DOMContentLoaded", () => {
    document
        .getElementById("form-filtro")
        .addEventListener("submit", function (e) {
            e.preventDefault();
            carregarRepresentantes(1);
        });

    document
        .getElementById("form-representante")
        .addEventListener("submit", async function (e) {
            e.preventDefault();

            const cidadeIds = [
                ...document.getElementById("cidade_ids").selectedOptions,
            ].map((opt) => opt.value);
            const dados = {
                nome: document.getElementById("nome").value,
                tipo: document.getElementById("tipo").value,
                documento: document.getElementById("documento").value,
                email: document.getElementById("email").value,
                telefone: document.getElementById("telefone").value,
                cidade_ids: cidadeIds,
            };

            try {
                if (representanteEmEdicao) {
                    await axios.put(
                        `${apiBase}/representantes/${representanteEmEdicao}`,
                        dados
                    );
                } else {
                    await axios.post(`${apiBase}/representantes`, dados);
                }
                fecharFormulario();
                carregarRepresentantes(paginaAtual);
            } catch (erro) {
                alert("Erro ao salvar representante.");
                console.error(erro);
            }
        });

    carregarCidades();
    carregarRepresentantes();
});
