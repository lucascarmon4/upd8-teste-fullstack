const apiBase = "/api";
let paginaAtual = 1;
let ultimaPagina = 1;
let estadoEmEdicao = null;

function atualizarTituloFormulario() {
    const titulo = document.querySelector("#form-container h2");
    const botao = document.getElementById("btn-submit");
    if (estadoEmEdicao) {
        titulo.textContent = "Editar Estado";
        botao.textContent = "Atualizar Estado";
    } else {
        titulo.textContent = "Novo Estado";
        botao.textContent = "Salvar Estado";
    }
}

function mostrarFormulario() {
    document.getElementById("form-container").classList.remove("hidden");
    atualizarTituloFormulario();
}

function fecharFormulario() {
    document.getElementById("form-container").classList.add("hidden");
    document.getElementById("form-estado").reset();
    estadoEmEdicao = null;
    atualizarTituloFormulario();
}

async function carregarEstados(pagina = 1) {
    const tbody = document.getElementById("tabela-estados");
    tbody.innerHTML = `<tr><td colspan="3" class="text-center py-3">Carregando...</td></tr>`;

    const params = {
        page: pagina,
        nome: document.getElementById("filtro-nome").value,
        sigla: document.getElementById("filtro-sigla").value,
    };

    try {
        const res = await axios.get(`${apiBase}/estados`, { params });
        tbody.innerHTML = "";

        if (!res.data.data || res.data.data.length === 0) {
            tbody.innerHTML = `<tr><td colspan="3" class="text-center py-3">Nenhum estado encontrado.</td></tr>`;
            return;
        }

        res.data.data.forEach((estado) => {
            const tr = document.createElement("tr");
            tr.innerHTML = `
                <td class="border px-2 py-1">${estado.nome}</td>
                <td class="border px-2 py-1">${estado.sigla}</td>
                <td class="border px-2 py-1 text-center space-x-2">
                    <button onclick="editarEstado(${estado.id})" class="bg-yellow-500 text-white px-2 py-1 rounded hover:bg-yellow-600 text-sm">Editar</button>
                    <button onclick="excluirEstado(${estado.id})" class="bg-red-500 text-white px-2 py-1 rounded hover:bg-red-600 text-sm">Excluir</button>
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
        ).textContent = `Página ${paginaAtual} de ${ultimaPagina} — Total: ${res.data.total} estados`;
    } catch (erro) {
        console.error(erro);
        tbody.innerHTML = `<tr><td colspan="3" class="text-center py-3 text-red-600">Erro ao carregar estados.</td></tr>`;
    }
}

async function excluirEstado(id) {
    if (confirm("Tem certeza que deseja excluir este estado?")) {
        await axios.delete(`${apiBase}/estados/${id}`);
        carregarEstados(paginaAtual);
    }
}

async function editarEstado(id) {
    try {
        const res = await axios.get(`${apiBase}/estados/${id}`);
        const estado = res.data;

        estadoEmEdicao = id;
        document.getElementById("nome").value = estado.nome;
        document.getElementById("sigla").value = estado.sigla;

        atualizarTituloFormulario();
        mostrarFormulario();
    } catch (error) {
        alert("Erro ao carregar estado para edição.");
        console.error(error);
    }
}

document.addEventListener("DOMContentLoaded", () => {
    document
        .getElementById("form-filtro")
        .addEventListener("submit", function (e) {
            e.preventDefault();
            carregarEstados(1);
        });

    document
        .getElementById("form-estado")
        .addEventListener("submit", async function (e) {
            e.preventDefault();
            const dados = {
                nome: document.getElementById("nome").value,
                sigla: document.getElementById("sigla").value.toUpperCase(),
            };

            try {
                if (estadoEmEdicao) {
                    await axios.put(
                        `${apiBase}/estados/${estadoEmEdicao}`,
                        dados
                    );
                } else {
                    await axios.post(`${apiBase}/estados`, dados);
                }
                fecharFormulario();
                carregarEstados(paginaAtual);
            } catch (erro) {
                alert("Erro ao salvar estado.");
                console.error(erro);
            }
        });

    carregarEstados();
});
