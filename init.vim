" Definição da tecla líder como Espaço (Space)
let mapleader = ' '
let maplocalleader = ' '

" Mapeamento para abrir um terminal na parte inferior (Space + t)
" Usamos 'botright' para forçar a abertura na parte de baixo
nnoremap <Leader>t :botright split term://bash<CR>
inoremap <Leader>t <Esc>:botright split term://bash<CR>

" Atalhos para alternar facilmente entre o terminal e o editor
tnoremap <Esc> <C-\><C-n> " Sai do modo de terminal pressionando Esc

" Definição do vim-plug
call plug#begin('~/.local/share/nvim/site/plugged')

"  Plugins

Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'nvim-lua/plenary.nvim' " Dependência necessária para o Telescope
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'vague2k/vague.nvim'
Plug 'echasnovski/mini.nvim'

" Adiciona nvim-tree.lua e a biblioteca de ícones
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-tree/nvim-web-devicons' " Necessário para os ícones

" Adicione o nvim-cmp e suas fontes (LSP, snippets, buffers)
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'          " Motor de snippets
Plug 'saadparwaiz1/cmp_luasnip'  " Fonte de snippets para o cmp
Plug 'neovim/nvim-lspconfig'

" Adicione snippets prontos para várias linguagens (importante!)
Plug 'rafamadriz/friendly-snippets'

" O bloco de plugins deve terminar aqui
call plug#end()


" Configurações em Lua para os plugins devem vir depois
lua require('mason-config')
lua require('explorer')
lua require('lsp_config')
lua require('terminal_config')
lua require('lualine_config')
lua require('bufferline_config')
lua require('telescope_config')

set number

" Ativação do colorscheme
colorscheme vague

