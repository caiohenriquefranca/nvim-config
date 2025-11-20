# 📘 Documentação Completa — Configuração do Neovim (nvim-config)

![Interface do Neovim](https://drive.google.com/file/d/1UltFIwKaGci1mRa8JUwz7HPZjLN5wSgF/view?usp=sharing)

<!-- Substitua a imagem acima por um screenshot real da sua configuração -->

Bem-vindo à documentação oficial da configuração **nvim-config**, uma personalização moderna, produtiva e minimalista do Neovim, criada para oferecer uma experiência semelhante ao VS Code, mas com toda a leveza e flexibilidade do Vim.

Esta documentação cobre:

* Instalação e primeiros passos
* Estrutura do projeto
* Explicação detalhada dos plugins
* Atalhos de teclado
* Funcionalidades principais
* Troubleshooting
* FAQs
* Como personalizar cada parte do setup

---

## 📦 1. Introdução

A configuração **nvim-config** foi criada para desenvolvedores que buscam:

* Performance extrema (Neovim + Lua)
* Autocompletar inteligente com LSP
* Interface organizada e intuitiva
* Ótima experiência para TypeScript, Python, Go, Rust e ML
* Terminal integrado, tree view, bufferline e muito mais

Esta documentação explica como usar, estender e manter essa configuração.

---

## 🚀 2. Instalação

### 2.1 Pré‑requisitos

Antes de instalar, garanta que seu sistema contém:

```bash
sudo apt update
sudo apt install git curl neovim
```

### 2.2 Instalação Automática

Clone o repositório e execute:

```bash
git clone https://github.com/caiohenriquefranca/nvim-config.git ~/nvim-config
cd ~/nvim-config
./install.sh
```

### 2.3 O Script Realiza:

* Backup de `~/.config/nvim` e `~/.local/share/nvim`
* Instala a nova estrutura de configuração
* Instala dependências do sistema (como `golang-go`)
* Executa `PlugInstall` e `MasonInstallAll`

Para iniciar:

```
nvim
```

---

## 📁 3. Estrutura da Configuração

A estrutura segue boas práticas do ecossistema Neovim:

```
~/.config/nvim/
├── init.vim                     # Arquivo principal
├── lua/
│   ├── bufferline_config.lua
│   ├── explorer.lua
│   ├── lsp_config.lua          # Core das LSPs e autocomplete
│   ├── lualine_config.lua
│   └── terminal_config.lua
└── install.sh                   # Instalador automático
```

### 3.1 init.vim

Responsável por carregar plugins, configurar opções base e chamar módulos Lua.

### 3.2 Pasta `lua/`

Contém toda a lógica da configuração organizada em módulos independentes.

---

## 🧩 4. Plugins — Detalhamento Completo

### 4.1 Interface / UI

| Função     | Plugin          | Descrição                    |
| ---------- | --------------- | ---------------------------- |
| Tema       | vague.nvim      | Tema moderno e leve          |
| Statusline | lualine.nvim    | Barra inferior personalizada |
| Bufferline | bufferline.nvim | Exibe buffers como abas      |

### 4.2 LSP e Autocompletar

| Função                     | Plugin                      |
| -------------------------- | --------------------------- |
| Gerenciador de pacotes LSP | mason.nvim                  |
| Cliente LSP                | nvim-lspconfig              |
| Autocomplete               | nvim-cmp                    |
| Snippets                   | LuaSnip + friendly-snippets |

LSPs instalados automaticamente:

* ts_ls
* pyright
* rust-analyzer
* gopls
* html / cssls
* lua_ls

### 4.3 Navegação

| Plugin          | Função            |
| --------------- | ----------------- |
| nvim-tree.lua   | Explorer moderno  |
| bufferline.nvim | Gestão de buffers |

### 4.4 Edição

| Plugin     | Função                        |
| ---------- | ----------------------------- |
| mini.pairs | Auto-fechamento de parênteses |

### 4.5 Terminal integrado

Implementado com função Lua `toggle_terminal()`.

---

## ⌨️ 5. Atalhos de Teclado (Keybindings)

A **tecla líder** é a barra de espaço (`<Leader>`).

| Atalho            | Ação                                   |
| ----------------- | -------------------------------------- |
| `<Leader>e`       | Abre/Fecha o explorer (NvimTreeToggle) |
| `<Leader>t`       | Terminal integrado toggle              |
| `Ctrl + h`        | Buffer anterior                        |
| `Ctrl + l`        | Próximo buffer                         |
| `Tab / Shift+Tab` | Navegação no autocomplete              |
| `Enter`           | Confirmar sugestão do autocomplete     |

---

## 🔧 6. Configurações Internas

### 6.1 LSP (lsp_config.lua)

Inclui:

* Keymaps LSP
* Diagnósticos visuais
* Configuração de servidores
* Integração com nvim-cmp

### 6.2 Explorador (explorer.lua)

* Auto open
* Ícones
* Sync com diretório

### 6.3 Terminal (terminal_config.lua)

Atalhos e criação de terminal em split inferior.

---

## 🛠️ 7. Troubleshooting

### 7.1 Plugins não carregam

Execute:

```
:PlugInstall
```

### 7.2 LSP não inicia

Abra o Mason:

```
:Mason
```

E instale o servidor da linguagem.

### 7.3 Erro ao iniciar o Neovim

Alguns casos resolvem limpando o cache:

```
rm -rf ~/.local/share/nvim
```

Reinstale com o script.

---

## ❓ 8. FAQ

### • Posso usar no Windows?

Sim, com WSL2.

### • Funciona no Mac?

Sim — apenas instale o Homebrew + Neovim.

### • Posso mudar atalhos?

Sim, basta editar o `init.vim` ou os módulos em `lua/`.

### • Quero trocar o tema, é possível?

Totalmente — substitua `vague.nvim` por outro.

---

## 🧩 9. Personalização

Sugestões:

* Adicionar Telescope.nvim
* Adicionar treesitter
* Adicionar git signs
* Integrar AI (Codeium, Copilot)
* Criar snippets personalizados

---

## 🧷 10. Atualizações

Para atualizar sua versão:

```
cd ~/.config/nvim
git pull
```

---

## 📚 11. Créditos

Criado por **Caio Henrique França**.
Inspirado em setups modernos para TypeScript, Python e produtividade com Neovim.
**Em constante atualização**

---


