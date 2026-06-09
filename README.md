# 🎧 HelpDesk Pro

<p align="center">
  <strong>Sistema completo de gestão de chamados desenvolvido com Ruby on Rails.</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=rubyonrails&logoColor=white">
  <img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white">
  <img src="https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwindcss&logoColor=white">
  <img src="https://img.shields.io/badge/API_REST-10B981?style=for-the-badge">
</p>

---

## 📌 Sobre o projeto

O **HelpDesk Pro** é uma aplicação web para gerenciamento de chamados de suporte, desenvolvida com foco em boas práticas, organização de atendimento e apresentação profissional para portfólio.

O sistema permite que usuários criem chamados, acompanhem status, adicionem comentários, recebam notificações e consultem prazos de atendimento por SLA.

Administradores possuem uma visão completa da operação, podendo visualizar todos os chamados, atribuir responsáveis, acompanhar métricas no dashboard e gerenciar o fluxo de atendimento.

---

## 🖼️ Screenshots

### 🔐 Login

![Login](docs/screenshots/login.png)

### 📊 Dashboard

![Dashboard](docs/screenshots/dashboard.png)

### 🎫 Lista de chamados

![Chamados](docs/screenshots/chamados.png)

### 📄 Detalhes do chamado

![Detalhes do chamado](docs/screenshots/chamados-detalhes.png)

### ➕ Novo chamado

![Novo chamado](docs/screenshots/new-chamado.png)

### 🔔 Notificações

![Notificações](docs/screenshots/notificacoes.png)

---

## ✨ Funcionalidades

* Cadastro e autenticação de usuários
* Login com Devise
* Perfis de acesso: usuário comum e administrador
* Criação, edição, listagem e exclusão de chamados
* Controle de status: aberto, em andamento e resolvido
* Controle de prioridade: baixa, média e alta
* SLA automático conforme prioridade do chamado
* Atribuição de responsável pelo atendimento
* Comentários em chamados
* Upload de anexos com Active Storage
* Histórico de atividades
* Notificações internas
* Dashboard com métricas e gráficos
* Pesquisa e filtros por status e prioridade
* API REST autenticada por token
* Interface personalizada com identidade visual grafite e verde esmeralda

---

## 📊 Dashboard

O painel principal apresenta indicadores importantes para acompanhamento dos chamados, como:

* Total de chamados
* Chamados abertos
* Chamados em andamento
* Chamados resolvidos
* Chamados de alta prioridade
* Chamados atrasados
* Chamados próximos do vencimento
* Gráficos por status, prioridade, data e situação do SLA

---

## 🔌 API REST

A aplicação possui uma API REST para integração externa, protegida por autenticação via token.

### Endpoints disponíveis

| Método | Endpoint              | Descrição           |
| ------ | --------------------- | ------------------- |
| GET    | `/api/v1/tickets`     | Lista chamados      |
| GET    | `/api/v1/tickets/:id` | Exibe um chamado    |
| POST   | `/api/v1/tickets`     | Cria um chamado     |
| PATCH  | `/api/v1/tickets/:id` | Atualiza um chamado |
| DELETE | `/api/v1/tickets/:id` | Remove um chamado   |

### Exemplo de requisição

```bash
curl -H "Authorization: Token SEU_TOKEN" \
http://localhost:3000/api/v1/tickets
```

---

## 🛠️ Tecnologias utilizadas

| Tecnologia     | Uso                       |
| -------------- | ------------------------- |
| Ruby           | Linguagem principal       |
| Ruby on Rails  | Framework web             |
| PostgreSQL     | Banco de dados            |
| Devise         | Autenticação              |
| Tailwind CSS   | Estilização da interface  |
| Active Storage | Upload de arquivos        |
| Hotwire/Turbo  | Interatividade Rails      |
| Chartkick      | Gráficos                  |
| Chart.js       | Renderização dos gráficos |
| Groupdate      | Agrupamento por datas     |
| Git/GitHub     | Versionamento             |

---

## 🚀 Como rodar o projeto localmente

Clone o repositório:

```bash
git clone https://github.com/DavyPereira/helpdesk_pro.git
```

Entre na pasta do projeto:

```bash
cd helpdesk_pro
```

Instale as dependências:

```bash
bundle install
```

Crie e migre o banco de dados:

```bash
rails db:create
rails db:migrate
```

Inicie o servidor:

```bash
bin/dev
```

Acesse no navegador:

```text
http://localhost:3000
```

---

## 🎨 Identidade visual

O projeto utiliza uma identidade visual baseada em:

* Grafite
* Verde esmeralda
* Layout SaaS corporativo
* Cards arredondados
* Fundos com padrões sutis
* Interface limpa e profissional

---

## 📌 Status do projeto

✅ Projeto funcional
✅ Interface personalizada
✅ Dashboard implementado
✅ Sistema de chamados completo
✅ Notificações internas
✅ API REST com autenticação por token
✅ Prints adicionados ao README

---

## 🧭 Próximas melhorias

* Deploy em produção
* Testes automatizados
* Envio de e-mails automáticos
* Exportação de relatórios
* Melhorias no painel administrativo
* Melhorias de responsividade

---

## 👨‍💻 Autor

Desenvolvido por **Davy Pereira**.

<p>
  <a href="https://github.com/DavyPereira">
    <img src="https://img.shields.io/badge/GitHub-DavyPereira-181717?style=for-the-badge&logo=github">
  </a>
</p>
