set tabstop=2
set shiftwidth=2
set expandtab
set number
set nocompatible
set t_Co=256
set t_ut=
set tags=tags
set path+=**


syntax on

execute pathogen#infect()
colorscheme codedark

autocmd Filetype python setlocal tabstop=4
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

nnoremap <C-\> :NERDTreeToggle<CR>
noremap ,break :-1read $HOME/.vim/snippets/python/breakpoint<CR>



# AIRLINE
let g:airline_theme = 'codedark'

# ALE
let g:ale_set_highlights = 1
let g:ale_python_pylint_change_directory = 0
let g:ale_python_pyline_auto_pipenv = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\  'python': ['black'],
\}
let g:ale_set_highlights = 1

# NERDTree
let NERDTreeShowHidden=1
