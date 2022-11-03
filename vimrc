runtime! debian.vim
" vim:fdm=marker

" ### System ### "
" {
" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" }

" ### Colors ### "
" {
" Colorscheme by default
colorscheme desert

" YAML colors
autocmd BufEnter *.yml colorscheme default
autocmd BufEnter *.yaml colorscheme default

" SH colors
autocmd BufEnter *.sh colorscheme ron

" }

" ### Remote ### "
" File types {{{{
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufEnter *.md set spell
" }}}}
" File explorer {{{{
" Open file on the right side when splitting
let g:netrw_altv=1
" Remove the banner
let g:netrw_banner=0
" Refresh files
nmap <unique> ,<C-R> <Plug>NetrwRefresh
" }}}}
" Leader key {{{{
let mapleader = "`"
set timeoutlen=500
" }}}}
" Tabs{{{{
nnoremap <leader>h :tabm -1<CR>
nnoremap <leader>l :tabm +1<CR>
nnoremap <leader>j :qa<CR>
" }}}}
" Other {{{{
set laststatus=1
set nohlsearch
nnoremap Y Y

" Remember folds
augroup remember_folds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent! loadview
augroup END

" Set tabs to be normal size
set tabstop=4
set shiftwidth=4
set expandtab

" Searching
set path+=**
" }}}}

" ### Same as IdeaVim ### "
" Tabs {{{{
" Split to the right and bottom
set splitbelow splitright

nnoremap <C-L> :tabnext<CR>
nnoremap <C-H> :tabprevious<CR>
" }}}}
" Editor hotkeys {{{{
" Exit Vim
nnoremap <C-J> :q!<CR>

" Saving the file
nnoremap <C-S> :w<CR>

" Remap Space in insert mode to %
map <Space> %

" Replace all instances of text
nnoremap \ :%s//gc<Left><Left><Left>

" Do vertical selection
nnoremap tt <c-v>

" Make yy select a line without a break
nnoremap yy ^y$

" Open new line without going to insert mode
nnoremap <Enter> o<Esc>

" Do operations inside ""
nnoremap cq ci"
nnoremap dq di"
nnoremap yq yi"
nnoremap vq vi"

" Do operations outside ""
nnoremap daq da"
nnoremap caq ca"
nnoremap yaq ya"
nnoremap vaq va"

" Do operations inside ()
nnoremap cb f(cib
nnoremap db f(dib
nnoremap yb f(yib
nnoremap vb f(vib

" Do operations up to a closing parentheses
nnoremap cp ct)
nnoremap dp dt)
nnoremap yp yt)
nnoremap vp vt)

" Do backwards operations
nnoremap dr bde
nnoremap cr bce
nnoremap yr bye
nnoremap vr bve

" Do operations inside file
nnoremap yif ggyG<C-O>
nnoremap dif ggdG
nnoremap cif ggcG
nnoremap vif vGogg

" }}}}
" Abbreviations {{{{
func Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc
iab sha #!/bin/bash<CR><C-R>=Eatchar('\s')<CR><CR><C-R>=Eatchar('\s')<CR>

" }}}}
" Other {{{{
" Set line numbers
set nu
set rnu
" }}}}
