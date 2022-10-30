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

" usability
Plug 'vim-airline/vim-airline'

" trainer
Plug 'ThePrimeagen/vim-be-good'
call plug#end()

autocmd vimenter * ++nested colorscheme sonokai
