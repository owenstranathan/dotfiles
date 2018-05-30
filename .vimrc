set tabstop=2
set shiftwidth=2
set expandtab
set number

syntax on

autocmd Filetype python setlocal tabstop=4

execute pathogen#infect()

let g:linters_extra = []

if executable("flake8")
  let g:linters_extra += [
  \   ['python', "flake8 %s > %s", ["%f:%l:%c: %t%n %m"]]
  \]
endif
