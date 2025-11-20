-- ~/.config/nvim/lua/terminal_config.lua

-- Remova 'local' daqui:
function toggle_terminal()
    -- Itera sobre todas as janelas abertas para ver se o terminal já existe
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        -- Usamos um ID global (g.terminal_buffer_id) para rastrear o buffer do terminal
        if vim.api.nvim_win_get_buf(win) == vim.g.terminal_buffer_id then
            -- Se for o terminal, fecha a janela
            vim.api.nvim_win_close(win, true)
            vim.g.terminal_buffer_id = nil -- Reseta o ID do buffer
            return
        end
    end

    -- Se não encontrou o terminal aberto, abre um novo no rodapé
    vim.cmd('botright split term://bash')
    -- Salva o ID do buffer do terminal recém-aberto
    vim.g.terminal_buffer_id = vim.api.nvim_get_current_buf()
end

-- O mapeamento de teclas pode permanecer o mesmo, pois agora 'toggle_terminal' é global
vim.api.nvim_set_keymap('n', '<Leader>t', '<Cmd>lua toggle_terminal()<CR>', { noremap = true, silent = true })

-- Mapeamento para sair do modo terminal com ESC (como antes)
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

