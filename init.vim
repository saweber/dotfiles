" Configuration

" Ensure 8 lines are visible
set scrolloff=8

" Show current line number and relative line numbers
set number
set relativenumber

" Set tab width to 2
set tabstop=2 softtabstop=2
set shiftwidth=2

set expandtab
set smartindent

" Syntax Highlighting
syntax enable

set termguicolors

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin(stdpath('config') . '/plugged')

" themes
Plug 'morhetz/gruvbox'
Plug 'sainnhe/everforest'
Plug 'sainnhe/sonokai'
Plug 'phanviet/vim-monokai-pro'

" tmux status line generator
"Plug 'edkolev/tmuxline.vim'
"let g:tmuxline_powerline_separators = 0

" usability
Plug 'vim-airline/vim-airline'

" fuzzy navigation
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" trainer
Plug 'ThePrimeagen/vim-be-good'
call plug#end()

let mapleader = ' '

# fuzzy navigation shortcuts
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" reload config without exiting shortcut
nnoremap <Leader><CR> :source ~/.config/nvim/init.vim<CR>

autocmd vimenter * ++nested colorscheme sonokai
