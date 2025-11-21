<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>nvim-config — Documentação</title>

<style>
/* ------------ RESET ------------ */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: Arial, Helvetica, sans-serif;
}

body {
  display: flex;
  background: #1e1e1e;
  color: #ddd;
}

/* ------------ SIDEBAR ------------ */
aside {
  width: 260px;
  background: #151515;
  height: 100vh;
  padding: 25px;
  position: fixed;
  overflow-y: auto;
  border-right: 1px solid #333;
}

aside h2 {
  margin-bottom: 15px;
  color: #fff;
}

aside a {
  display: block;
  color: #ccc;
  text-decoration: none;
  margin: 8px 0;
  font-size: 14px;
}

aside a:hover {
  color: #4bb2ff;
}

/* ------------ MAIN CONTENT ------------ */
main {
  margin-left: 280px;
  padding: 40px;
  width: calc(100% - 280px);
}

main h1, main h2, main h3 {
  margin-bottom: 12px;
  color: #4bb2ff;
}

main p {
  margin-bottom: 15px;
  line-height: 1.6;
}

code {
  background: #2b2b2b;
  padding: 3px 6px;
  border-radius: 4px;
  color: #a3e7ff;
}

pre {
  background: #2b2b2b;
  padding: 18px;
  border-radius: 6px;
  overflow-x: auto;
  margin-bottom: 20px;
}

/* Tables */
table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 25px;
}

table th, table td {
  border: 1px solid #555;
  padding: 10px;
  text-align: left;
}

table th {
  background: #2b2b2b;
}

/* Images */
img {
  border-radius: 8px;
  margin-bottom: 20px;
}

/* ------------ HEADERS ------------ */
.separator {
  height: 2px;
  background: #444;
  margin: 25px 0;
}
</style>
</head>

<body>

<!-- ============= SIDEBAR ============= -->
<aside>
  <h2>📘 Documentação</h2>
  <a href="#intro">Introdução</a>
  <a href="#install">Instalação</a>
  <a href="#structure">Estrutura</a>
  <a href="#plugins">Plugins</a>
  <a href="#telescope">Busca (Telescope)</a>
  <a href="#keys">Keybindings</a>
  <a href="#config">Configurações Internas</a>
  <a href="#troubleshooting">Troubleshooting</a>
  <a href="#faq">FAQ</a>
  <a href="#credits">Créditos</a>
</aside>

<!-- ============= MAIN CONTENT ============= -->
<main>

<h1>Minhas Configurações do Neovim (nvim-config)</h1>

<img src="nvim.png" width="800" alt="Screenshot da Configuração do Neovim">
<img src="nvim-tree.png" width="380" alt="NvimTree">
<img src="lsp.png" width="380" alt="LSP">

<div class="separator"></div>

<!-- INTRO -->
<h2 id="intro">1. Introdução</h2>
<p>
A configuração <strong>nvim-config</strong> é uma personalização moderna e minimalista 
do Neovim, oferecendo uma experiência inspirada no VS Code, mas com toda a leveza e 
velocidade do Vim.
</p>

<ul>
  <li>Alto desempenho (Neovim + Lua)</li>
  <li>Autocompletar avançado via LSP</li>
  <li>Suporte nativo para TypeScript, Python, Go, Rust e ML</li>
  <li>Telescope para busca instantânea</li>
  <li>Terminal integrado, Bufferline e muito mais</li>
</ul>

<div class="separator"></div>

<!-- INSTALL -->
<h2 id="install">2. Instalação</h2>

<h3>2.1 Pré-requisitos</h3>
<pre><code>sudo apt update
sudo apt install git curl neovim
</code></pre>

<h3>2.2 Instalação Automática</h3>
<pre><code>git clone https://github.com/caiohenriquefranca/nvim-config.git ~/nvim-config
cd ~/nvim-config
./install.sh
</code></pre>

<h3>2.3 Dependências para busca (Telescope)</h3>
<pre><code>sudo apt install ripgrep fd-find
mkdir -p ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd
</code></pre>

<div class="separator"></div>

<!-- STRUCTURE -->
<h2 id="structure">3. Estrutura da Configuração</h2>

<pre><code>~/.config/nvim/
├── init.vim
├── lua/
│   ├── bufferline_config.lua
│   ├── explorer.lua
│   ├── lsp_config.lua
│   ├── lualine_config.lua
│   ├── terminal_config.lua
│   ├── telescope_config.lua
└── install.sh
</code></pre>

<div class="separator"></div>

<!-- PLUGINS -->
<h2 id="plugins">4. Plugins — Detalhamento Completo</h2>

<h3>Interface / UI</h3>
<table>
<tr><th>Função</th><th>Plugin</th></tr>
<tr><td>Tema</td><td>vague.nvim</td></tr>
<tr><td>Statusline</td><td>lualine.nvim</td></tr>
<tr><td>Buffers</td><td>bufferline.nvim</td></tr>
</table>

<h3>LSP e Autocomplete</h3>
<table>
<tr><th>Função</th><th>Plugin</th></tr>
<tr><td>Gerenciador LSP</td><td>mason.nvim</td></tr>
<tr><td>Configuração LSP</td><td>nvim-lspconfig</td></tr>
<tr><td>Autocomplete</td><td>nvim-cmp</td></tr>
<tr><td>Snippets</td><td>LuaSnip + friendly-snippets</td></tr>
</table>

<h3>Navegação</h3>
<table>
<tr><th>Plugin</th><th>Função</th></tr>
<tr><td>nvim-tree.lua</td><td>Explorer</td></tr>
<tr><td>bufferline.nvim</td><td>Buffers</td></tr>
</table>

<div class="separator"></div>

<!-- TELESCOPE -->
<h2 id="telescope">5. Sistema de Busca (Telescope)</h2>

<h3>Resumo da Implementação</h3>
<ul>
  <li>Utiliza <strong>telescope.nvim</strong> como fuzzy finder principal.</li>
  <li>Integração com <code>ripgrep</code> e <code>fd</code> para máxima performance.</li>
  <li>Extensão <code>telescope-fzf-native</code> para filtragem instantânea.</li>
  <li>Configuração modular em <code>lua/telescope_config.lua</code>.</li>
</ul>

<h3>Atalhos da Busca</h3>
<table>
<tr><th>Atalho</th><th>Ação</th></tr>
<tr><td>&lt;Leader&gt;ff</td><td>Buscar arquivos</td></tr>
<tr><td>&lt;Leader&gt;fg</td><td>Live Grep – buscar texto</td></tr>
<tr><td>&lt;Leader&gt;fG</td><td>Buscar a palavra sob o cursor</td></tr>
<tr><td>*</td><td>Realçar palavra no buffer</td></tr>
</table>

<div class="separator"></div>

<!-- KEYS -->
<h2 id="keys">6. Atalhos de Teclado (Keybindings)</h2>

<table>
<tr><th>Atalho</th><th>Ação</th></tr>
<tr><td>&lt;Leader&gt;e</td><td>Abrir o Explorer</td></tr>
<tr><td>&lt;Leader&gt;t</td><td>Terminal integrado</td></tr>
<tr><td>Ctrl + h</td><td>Buffer anterior</td></tr>
<tr><td>Ctrl + l</td><td>Próximo buffer</td></tr>
<tr><td>Tab / Shift+Tab</td><td>Navegar autocomplete</td></tr>
<tr><td>Enter</td><td>Confirmar sugestão</td></tr>
</table>

<div class="separator"></div>


<!-- INTERNAL CONFIG -->
<h2 id="config">7. Configurações Internas</h2>

<ul>
  <li><strong>LSP:</strong> keymaps, diagnósticos, servidores e nvim-cmp.</li>
  <li><strong>Explorer:</strong> auto-open, ícones, sync de diretório.</li>
  <li><strong>Terminal:</strong> split inferior automático.</li>
  <li><strong>Telescope:</strong> filtros, previews, mapeamentos.</li>
</ul>

<div class="separator"></div>

<!-- TROUBLESHOOTING -->
<h2 id="troubleshooting">8. Troubleshooting</h2>

<h3>Plugins não carregam</h3>
<pre><code>:PlugInstall</code></pre>

<h3>LSP não inicia</h3>
<pre><code>:Mason</code></pre>

<h3>Erro ao iniciar</h3>
<pre><code>rm -rf ~/.local/share/nvim</code></pre>

<div class="separator"></div>

<!-- FAQ -->
<h2 id="faq">9. FAQ</h2>

<p><strong>Funciona no Windows?</strong> Sim, via WSL2.</p>
<p><strong>Funciona no macOS?</strong> Totalmente.</p>
<p><strong>Posso mudar atalhos?</strong> Sim, via módulos Lua.</p>
<p><strong>Posso trocar o tema?</strong> Sim, no módulo de UI.</p>

<div class="separator"></div>

<!-- CREDITS -->
<h2 id="credits">10. Créditos</h2>
<p>
Criado por <strong>Caio Henrique França Valentim</strong>.<br>
Setup em constante evolução.
</p>

</main>
</body>
</html>
