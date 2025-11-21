-- ~/.config/nvim/lua/telescope_config.lua

-- Define a função de configuração do Telescope
local setup_telescope = function()
    -- Carrega os módulos necessários
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    -- Configuração principal do Telescope
    telescope.setup({
        defaults = {
            -- AQUI: Define o sorter padrão para usar o fzf-native (se instalado)
            -- Isso garante que a busca enquanto você digita seja rápida.
            generic_sorter = require("telescope.sorters").get_fzf_string_sorter,
            mappings = {
                i = {
                    ['<C-q>'] = actions.send_to_qflist,
                },
            },
        },
        --pickers = {
            --find_files = {
                -- Usa 'fd' para buscar arquivos
                --find_command = { "fd", "--type", "f", "--strip-cwd", "--hidden", "--exclude", ".git" },
            --},
        --},
    })

    -- Carrega a extensão fzf-native (importante para que a linha acima funcione)
    pcall(require('telescope').load_extension, 'fzf')
    
    -- ... (seus mapeamentos de teclas abaixo continuam os mesmos) ...

    -- 1. Buscador de Arquivos no Projeto
    vim.keymap.set('n', '<leader>ff', function()
        require('telescope.builtin').find_files()
    end, { desc = "Find Files (Project)" })

    -- 2. Buscador de Palavras em Todo o Projeto (Live Grep)
    vim.keymap.set('n', '<leader>fg', function()
        require('telescope.builtin').live_grep()
    end, { desc = "Live Grep (Project Search)" })

    -- 3. Busca a palavra sob o cursor em todo o projeto
    vim.keymap.set('n', '<leader>fG', function()
        local word = vim.fn.expand("<cword>")
        require('telescope.builtin').grep_string({ search = word })
    end, { desc = "Grep word under cursor (Project)" })

    -- 4. Busca de Palavras no Arquivo Atual (Vim Grep nativo)
    vim.keymap.set('n', '*', '*', { desc = "Search word under cursor in current file" })
end

-- Executa a configuração
setup_telescope()

