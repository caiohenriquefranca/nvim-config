-- ~/.config/nvim/lua/lsp_config.lua

-- 1. Define as variáveis locais primeiro (essencial para evitar o erro index global 'cmp' a nil value)
local cmp = require('cmp')
local luasnip = require('luasnip')

-- 2. Define quais servidores o Mason deve instalar e configura a instalação automática
require("mason-lspconfig").setup({
    -- Uma lista de Language Servers que você quer instalados
    ensure_installed = {
        "lua_ls",         -- Lua (para config do Neovim)
        "pyright",        -- Python (inclui suporte para tipagem em ML)
        "html",
        "cssls",
        "ts_ls",          -- TypeScript/JavaScript
        "rust_analyzer",  -- Rust
        "gopls",          -- Golang
    },
    -- Configuração que será executada para CADA servidor instalado
    handlers = {
        -- O handler padrão (usa a configuração básica do lspconfig para todos)
        function(server_name)
            require("lspconfig")[server_name].setup({
                -- Esta linha conecta o LSP ao motor de autocompletar nvim-cmp
                capabilities = require('cmp_nvim_lsp').default_capabilities()
            })
        end,
    }
})


-- 3. Configuração do nvim-cmp (Autocompletar)
cmp.setup({
    snippet = {
        -- Define o LuaSnip como o motor de snippets
        expand = function(args)
            luasnip.expand(args.body)
        end,
    },
    -- Fontes de sugestões (LSP, Snippets, Buffers, etc)
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
    }),
    -- Mapeamentos de teclas para o CMP (Tab para avançar/pular, Enter para aceitar)
    mapping = cmp.mapping.preset.insert({
      ['<C-Space>'] = cmp.mapping.complete(), -- Abre sugestões manualmente
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Aceita a sugestão com Enter
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),

    require("mini.pairs").setup()
})

