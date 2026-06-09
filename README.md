# 🎧 HelpDesk Pro

<p align="center">
  <strong>Sistema completo de gestão de chamados desenvolvido com Ruby on Rails.</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Ruby-Rails-red?style=for-the-badge&logo=rubyonrails">
  <img src="https://img.shields.io/badge/PostgreSQL-Database-blue?style=for-the-badge&logo=postgresql">
  <img src="https://img.shields.io/badge/TailwindCSS-Interface-38B2AC?style=for-the-badge&logo=tailwindcss">
  <img src="https://img.shields.io/badge/API-REST-10B981?style=for-the-badge">
</p>

---

## 📌 Sobre o projeto

O **HelpDesk Pro** é uma aplicação web para gerenciamento de chamados de suporte, criada com foco em aprendizado, boas práticas e construção de portfólio.

O sistema permite que usuários criem chamados, adicionem comentários, anexem arquivos, acompanhem status, recebam notificações e consultem prazos de atendimento por SLA.

Administradores possuem uma visão mais ampla da operação, podendo visualizar todos os chamados, atribuir responsáveis, acompanhar métricas no dashboard e gerenciar o fluxo de atendimento.

---

## ✨ Funcionalidades

### 👤 Usuários e permissões

- Cadastro e login de usuários
- Autenticação com Devise
- Perfis de acesso:
  - Usuário comum
  - Administrador
- Controle de acesso aos chamados
- Administrador visualiza todos os chamados
- Usuário comum visualiza apenas seus próprios chamados

### 🎫 Chamados

- Criação de chamados
- Edição de chamados
- Exclusão de chamados
- Listagem de chamados
- Detalhamento individual
- Pesquisa por título
- Filtros por status e prioridade

### 🚦 Status e prioridades

- Status:
  - Aberto
  - Em andamento
  - Resolvido
- Prioridades:
  - Baixa
  - Média
  - Alta

### ⏱️ SLA

- SLA automático conforme prioridade
- Chamados de alta prioridade com prazo menor
- Exibição do prazo final
- Indicadores visuais:
  - No prazo
  - Vencendo
  - Atrasado
  - Resolvido

### 👨‍💻 Responsável pelo chamado

- Atribuição de técnico/responsável
- Administrador pode definir responsável
- Listagem mostra quem está atendendo cada chamado

### 💬 Comentários

- Comentários dentro de cada chamado
- Histórico de conversa
- Identificação do usuário que comentou
- Registro automático da atividade

### 📎 Anexos

- Upload de arquivos nos chamados
- Suporte via Active Storage
- Download de anexos
- Organização por chamado

### 🔔 Notificações

- Notificações internas
- Contador de notificações não lidas
- Notificação ao receber interação em chamado
- Página dedicada para visualizar notificações

### 🧾 Histórico de atividades

- Registro de ações importantes
- Criação de chamados
- Atualização de chamados
- Mudança de status
- Alteração de prioridade
- Atribuição de responsável
- Comentários adicionados

### 📊 Dashboard

- Total de chamados
- Chamados abertos
- Chamados em andamento
- Chamados resolvidos
- Chamados de alta prioridade
- Chamados atrasados
- Chamados vencendo
- Gráficos por status
- Gráficos por prioridade
- Gráficos por dia
- Gráfico de situação do SLA

### 🔌 API REST

- API protegida por token
- Listagem de chamados
- Detalhes de chamado
- Criação via API
- Atualização via API
- Exclusão via API

---

## 🖼️ Screenshots

### 🔐 Login

![Login](docs/screenshots/login.png)

### 📊 Dashboard

![Dashboard](docs/screenshots/dashboard.png)

### 🎫 Lista de chamados

![Chamados](docs/screenshots/tickets.png)

### 📄 Detalhes do chamado

![Detalhes do chamado](docs/screenshots/ticket-details.png)

### 🔔 Notificações

![Notificações](docs/screenshots/notifications.png)

---

## 🛠️ Tecnologias utilizadas

| Tecnologia | Uso |
|---|---|
| Ruby | Linguagem principal |
| Ruby on Rails | Framework web |
| PostgreSQL | Banco de dados |
| Devise | Autenticação |
| Tailwind CSS | Interface |
| Active Storage | Upload de arquivos |
| Hotwire/Turbo | Interatividade Rails |
| Chartkick | Gráficos |
| Chart.js | Biblioteca de gráficos |
| Groupdate | Agrupamento por datas |
| REST API | Integração externa |
| Git/GitHub | Versionamento |

---

## 🧱 Estrutura principal

```text
app/
├── controllers/
│   ├── tickets_controller.rb
│   ├── comments_controller.rb
│   ├── dashboard_controller.rb
│   ├── notifications_controller.rb
│   └── api/v1/tickets_controller.rb
│
├── models/
│   ├── user.rb
│   ├── ticket.rb
│   ├── comment.rb
│   ├── notification.rb
│   └── activity.rb
│
└── views/
    ├── tickets/
    ├── dashboard/
    ├── notifications/
    └── devise/