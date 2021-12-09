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

call plug#begin('~/.vim/plugged')
Plug 'ayu-theme/ayu-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

set termguicolors
let ayucolor="mirage"
colorscheme ayu

" Remaps
let mapleader = ' '
nnoremap <Leader>pt :Vex<CR>
nnoremap <Leader><CR> :source ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>lt :colorscheme morning<CR>
nnoremap <Leader>dt :colorscheme ayu<CR>
