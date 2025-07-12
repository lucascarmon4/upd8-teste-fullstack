window.apiBase = "/api";
window.paginaAtual = 1;
window.ultimaPagina = 1;
let clienteEmEdicao = null;

window.formatarData = function (dataIso) {
    const [ano, mes, dia] = dataIso.split("-");
    return `${dia}/${mes}/${ano}`;
};

window.atualizarTituloFormulario = function () {
    const titulo = document.querySelector("#form-container h2");
    const botao = document.getElementById("btn-submit");
    if (clienteEmEdicao) {
        titulo.textContent = "Editar Cliente";
        botao.textContent = "Atualizar Cliente";
    } else {
        titulo.textContent = "Novo Cliente";
        botao.textContent = "Salvar Cliente";
    }
};

window.mostrarFormulario = function () {
    document.getElementById("form-container").classList.remove("hidden");
    atualizarTituloFormulario();
};

window.fecharFormulario = function () {
    document.getElementById("form-container").classList.add("hidden");
    document.getElementById("form-cliente").reset();
    clienteEmEdicao = null;
    atualizarTituloFormulario();
};

window.carregarCidades = async function () {
    const res = await axios.get(`${apiBase}/cidades/all`);
    const selectCidade = document.getElementById("cidade_id");
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
};

window.carregarClientes = async function (pagina = 1) {
    const tbody = document.getElementById("tabela-clientes");
    tbody.innerHTML = `<tr><td colspan="7" class="text-center py-3">Carregando...</td></tr>`;

    const params = {
        page: pagina,
        nome: document.getElementById("filtro-nome").value,
        sexo: document.getElementById("filtro-sexo").value,
        cidade_id: document.getElementById("filtro-cidade").value,
    };

    try {
        const res = await axios.get(`${apiBase}/clientes`, { params });
        tbody.innerHTML = "";

        if (!res.data.data || res.data.data.length === 0) {
            tbody.innerHTML = `<tr><td colspan="7" class="text-center py-3">Nenhum cliente encontrado.</td></tr>`;
            return;
        }

        res.data.data.forEach((cliente) => {
            const tr = document.createElement("tr");
            tr.innerHTML = `
                <td class="border px-2 py-1">${cliente.nome}</td>
                <td class="border px-2 py-1">${cliente.cpf}</td>
                <td class="border px-2 py-1">${cliente.sexo}</td>
                <td class="border px-2 py-1">${formatarData(
                    cliente.data_nascimento
                )}</td>
                <td class="border px-2 py-1">${cliente.cidade.nome}</td>
                <td class="border px-2 py-1">${cliente.cidade.estado.sigla}</td>
                <td class="border px-2 py-1 text-center space-x-2">
                    <button onclick="editarCliente(${
                        cliente.id
                    })" class="bg-yellow-500 text-white px-2 py-1 rounded hover:bg-yellow-600 text-sm">Editar</button>
                    <button onclick="excluirCliente(${
                        cliente.id
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
        ).textContent = `Página ${paginaAtual} de ${ultimaPagina} — Total: ${res.data.total} clientes`;
    } catch (erro) {
        tbody.innerHTML = `<tr><td colspan="7" class="text-center py-3 text-red-600">Erro ao carregar clientes.</td></tr>`;
        console.error(erro);
    }
};

window.excluirCliente = async function (id) {
    if (confirm("Tem certeza que deseja excluir este cliente?")) {
        await axios.delete(`${apiBase}/clientes/${id}`);
        carregarClientes(paginaAtual);
    }
};

window.editarCliente = async function (id) {
    try {
        const res = await axios.get(`${apiBase}/clientes/${id}`);
        const cliente = res.data;

        clienteEmEdicao = id;
        document.getElementById("nome").value = cliente.nome;
        document.getElementById("cpf").value = cliente.cpf;
        document.getElementById("data_nascimento").value =
            cliente.data_nascimento;
        document.getElementById("sexo").value = cliente.sexo;
        document.getElementById("cidade_id").value = cliente.cidade_id;

        atualizarTituloFormulario();
        mostrarFormulario();
    } catch (error) {
        alert("Erro ao carregar cliente para edição.");
        console.error(error);
    }
};

document.addEventListener("DOMContentLoaded", () => {
    document
        .getElementById("form-cliente")
        .addEventListener("submit", async function (e) {
            e.preventDefault();
            const dados = {
                nome: document.getElementById("nome").value,
                cpf: document.getElementById("cpf").value,
                data_nascimento:
                    document.getElementById("data_nascimento").value,
                sexo: document.getElementById("sexo").value,
                cidade_id: document.getElementById("cidade_id").value,
            };
            try {
                if (clienteEmEdicao) {
                    await axios.put(
                        `${apiBase}/clientes/${clienteEmEdicao}`,
                        dados
                    );
                } else {
                    await axios.post(`${apiBase}/clientes`, dados);
                }
                fecharFormulario();
                carregarClientes(paginaAtual);
            } catch (error) {
                alert("Erro ao salvar cliente.");
                console.error(error);
            }
        });

    document
        .getElementById("form-filtro")
        .addEventListener("submit", function (e) {
            e.preventDefault();
            carregarClientes(1);
        });

    carregarCidades();
    carregarClientes();
});
