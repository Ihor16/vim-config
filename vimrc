runtime! debian.vim

if has("syntax")
  syntax on
endif

" Colors
" Colorscheme by default
colorscheme desert

" YAML colors
autocmd BufEnter *.yml colorscheme default
autocmd BufEnter *.yaml colorscheme default

" SH colors
autocmd BufEnter *.sh colorscheme ron

source ./remote.vim
