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
noremap ,break :-1read $HOME/.vim/snippets/python/breakpoint<CR>


set t_Co=256
set t_ut=
colorscheme codedark

let g:airline_theme = 'codedark'
let g:ale_set_highlights = 1
let g:ale_python_pylint_change_directory = 0
let g:ale_python_pyline_auto_pipenv = 1
