-- ~/.config/nvim/lua/explorer.lua

-- Desabilita o explorador de arquivos padrão do Neovim (netrw)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Use a configuração mínima e padrão que deve funcionar em todas as versões:
require("nvim-tree").setup({
    -- Apenas define a largura e fecha automaticamente ao abrir um arquivo
    view = {
        width = 35,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
})

-- Mapeamento de teclas (mantemos o Space + e)
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

