-- ~/.config/nvim/lua/bufferline_config.lua

require("bufferline").setup({
    options = {
        numbers = "ordinal",
        indicator = {
            style = 'icon', -- Ícones bonitinhos
        },
        buffer_close_icon = ' X',
        modified_icon = '●',
        close_icon = ' CL',
        left_trunc_marker = '',
        right_trunc_marker = '',
        diagnostics = "nvim_lsp", -- Mostra erros/warnings nas abas
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true
        }} -- Offset para não cobrir o NvimTree
    }
})

-- Mapeamentos úteis para navegar entre buffers (Ctrl + h/l)
vim.api.nvim_set_keymap('n', '<C-h>', ':BufferLineCyclePrev<CR>', {})
vim.api.nvim_set_keymap('n', '<C-l>', ':BufferLineCycleNext<CR>', {})

