# Teste Desenvolvedor Full Stack Jr - Upd8

Este projeto foi desenvolvido em Laravel 10 e MySQL como parte do processo seletivo da Upd8.

## 📦 Funcionalidades

-   CRUD de Representantes com:
    -   Nome, Tipo (PF/PJ), Documento, Email, Telefone
    -   Relacionamento N:N com cidades atendidas
-   CRUD de Cidades com vínculo ao Estado
-   CRUD de Clientes com vínculo a cidade
-   CRUD de Estados
-   API RESTful integrada ao frontend HTML/JS
-   Migrations e Seeders configurados

---

## 🚀 Como rodar o projeto

### 1. Clone o repositório

```bash
git clone https://github.com/lucascarmon4/upd8-teste-fullstack.git
cd upd8-teste-fullstack
```

### 2. Instale as dependências

```bash
composer install
```

### 3. Configure o ambiente

```bash
cp .env.exemplo .env
php artisan key:generate
```

> Configure o `.env` com os dados corretos do seu banco MySQL.

### 4. Rode as migrations e seeders

```bash
php artisan migrate
php artisan db:seed
```

### 5. Suba o servidor local

```bash
php artisan serve
```

Acesse: [http://localhost:8000](http://localhost:8000)

---

## 🛠️ Scripts SQL obrigatórios

Veja o arquivo [`docs/sql-consultas.sql`](docs/sql-consultas.sql) com:

-   Representantes que atendem um cliente (por ID)
-   Representantes de uma cidade

---

## 🧱 Estrutura do Banco

A estrutura da base também está disponível em [`docs/ddl-schema.sql`](docs/ddl-schema.sql), exportada via HeidiSQL.

---

Feito por Lucas Carmona Neto 💻
