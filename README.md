<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Documentação — nvim-config</title>

<style>
    body {
        font-family: Arial, Helvetica, sans-serif;
        max-width: 900px;
        margin: 20px auto;
        background: #f5f5f5;
        color: #222;
        padding: 20px;
        line-height: 1.6;
    }

    h1, h2, h3 {
        color: #111;
        border-bottom: 2px solid #ddd;
        padding-bottom: 4px;
    }

    img {
        width: 100%;
        border-radius: 6px;
        margin-bottom: 20px;
    }

    code {
        background: #eee;
        padding: 3px 5px;
        border-radius: 4px;
    }

    pre {
        background: #272822;
        color: #f8f8f2;
        padding: 14px;
        border-radius: 6px;
        overflow-x: auto;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin: 14px 0;
    }
    table th, table td {
        border: 1px solid #ccc;
        padding: 8px;
    }
    table th {
        background: #e2e2e2;
    }

    .tag {
        background: #222;
        color: #fff;
        padding: 3px 8px;
        border-radius: 4px;
    }

    .section {
        margin-top: 30px;
    }
</style>

</head>
<body>

<h1>Minhas Configurações do Neovim (nvim-config)</h1>
<img src="nvim.png" alt="Screenshot do Neovim">

<p>
Bem-vindo à documentação oficial das minhas configurações <strong>nvim-config</strong>, uma personalização moderna, produtiva e minimalista do Neovim, criada para oferecer uma experiência semelhante ao VS Code, mas com toda a leveza e flexibilidade do Vim.
</p>

<hr>

<h2 class="section">📦 1. Introdução</h2>

<p>A configuração <strong>nvim-config</strong> foi criada para desenvolvedores que buscam:</p>

<ul>
    <li>Performance extrema (Neovim + Lua)</li>
    <li>Autocompletar inteligente com LSP</li>
    <li>Interface organizada e intuitiva</li>
    <li>Ambiente otimizado para TypeScript, Python, Go, Rust e ML</li>
    <li>Terminal integrado, tree view, bufferline e muito mais</li>
</ul>

<hr>

<h2 class="section">🚀 2. Instalação</h2>

<h3>2.1 Pré-requisitos</h3>
<pre><code>sudo apt update
sudo apt install git curl neovim
</code></pre>

<h3>2.2 Instalação Automática</h3>
<pre><code>git clone https://github.com/caiohenriquefranca/nvim-config.git ~/nvim-config
cd ~/nvim-config
./install.sh
</code></pre>

<h3>2.3 O Script Realiza:</h3>

<ul>
<li>Backup de pastas antigas</li>
<li>Instalação dos plugins</li>
<li>Configuração automática dos LSPs via Mason</li>
</ul>

<hr>

<h2 class="section">📁 3. Estrutura da Configuração</h2>

<pre><code>~/.config/nvim/
├── init.vim
├── lua/
│   ├── bufferline_config.lua
│   ├── explorer.lua
│   ├── lsp_config.lua
│   ├── lualine_config.lua
│   ├── telescope_config.lua
│   └── terminal_config.lua
└── install.sh
</code></pre>

<hr>

<h2 class="section">🔍 4. Busca de Arquivos e Texto (Telescope)</h2>

<h3><strong>Resumo da Implementação</strong></h3>

<ul>
<li><strong>Plugin Principal:</strong> telescope.nvim — fuzzy finder moderno do Neovim</li>
<li><strong>Performance:</strong> ripgrep + fd garantindo buscas instantâneas</li>
<li><strong>Filtro em tempo real:</strong> Extensão <code>telescope-fzf-native</code></li>
<li><strong>Modularidade:</strong> Configuração em <code>lua/telescope_config.lua</code></li>
</ul>

<h3>Pré-requisitos (Linux)</h3>

<pre><code>sudo apt install ripgrep fd-find
mkdir -p ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd
</code></pre>

<h3>Atalhos (usando &lt;Leader&gt; = Espaço)</h3>

<table>
<tr><th>Atalho</th><th>Ação</th></tr>
<tr><td>&lt;Leader&gt;ff</td><td>Buscar arquivos</td></tr>
<tr><td>&lt;Leader&gt;fg</td><td>Buscar texto (Live Grep)</td></tr>
<tr><td>&lt;Leader&gt;fG</td><td>Buscar palavra sob o cursor</td></tr>
<tr><td>*</td><td>Realçar palavra no arquivo atual</td></tr>
</table>

<hr>

<h2 class="section">⌨️ 5. Atalhos de Teclado</h2>

<table>
<tr><th>Atalho</th><th>Ação</th></tr>
<tr><td>&lt;Leader&gt;e</td><td>Abrir explorer</td></tr>
<tr><td>&lt;Leader&gt;t</td><td>Terminal integrado</td></tr>
<tr><td>Ctrl + h</td><td>Buffer anterior</td></tr>
<tr><td>Ctrl + l</td><td>Próximo buffer</td></tr>
</table>

<hr>

<h2 class="section">🛠️ 6. Troubleshooting</h2>

<h3>Plugins não carregam</h3>
<pre><code>:PlugInstall
</code></pre>

<h3>LSP não inicia</h3>
<pre><code>:Mason
</code></pre>

<hr>

<h2>📚 Créditos</h2>

<p>Criado por <strong>Caio Henrique França Valentim</strong>.  
Projeto em constante evolução.</p>

</body>
</html>
