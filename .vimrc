set tabstop=2
set shiftwidth=2
set expandtab
set number
set nocompatible

execute pathogen#infect()

syntax on

autocmd Filetype python setlocal tabstop=4
set path+=**

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeShowHidden=1

nnoremap <C-\> :NERDTreeToggle<CR>

