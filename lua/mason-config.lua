-- Configuração para o plugin Mason e Mason-LSPConfig

-- 1. Configuração do Mason
require("mason").setup({
    -- Personaliza os ícones na interface do Mason (opcional)
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
    -- Outras opções padrão podem ser configuradas aqui, se necessário.
})

-- 2. Configuração do Mason-LSPConfig
-- Isso ajuda a configurar automaticamente os Language Servers que o Mason instala.
require("mason-lspconfig").setup({
    -- Uma lista de Language Servers que você quer que o Mason tente instalar automaticamente
    ensure_installed = {
        "lua_ls",     -- Servidor de linguagem para Lua (útil para configurar o Neovim)
        "pyright",    -- Servidor de linguagem para Python
        "html",       -- Servidor de linguagem para HTML
        "cssls",      -- Servidor de linguagem para CSS
        "ts_ls",   -- Servidor de linguagem para TypeScript/JavaScript
    },
    -- "automatic_installation = true" é o padrão, então não precisa ser explícito.
})

