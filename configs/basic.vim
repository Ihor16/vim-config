" Configuration that edits only Vim default components,
" so it doesn't require external dependencies

runtime! debian.vim

if has("syntax")
  syntax on
endif

" File types
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufEnter *.txt set nonu | set nornu | colorscheme default | set spell
autocmd BufEnter *.md set spell

" File explorer
" Open file on the right side when splitting
let g:netrw_altv=1
" Remove the banner
let g:netrw_banner=0
" Refresh files
nmap <unique> ,<C-R> <Plug>NetrwRefresh

" Leader key
nnoremap ` `
let mapleader = "`"
set timeoutlen=500

" Tabs
nnoremap <leader>l :tabm +1<CR>
nnoremap <leader>h :tabm -1<CR>
nnoremap <leader>j :qa!<CR>
nnoremap <leader>k :tabclose<CR>
nnoremap <leader>o :Vex<CR>

" Other
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

" ### IdeaVim ### "
" Tabs
" Split to the right and bottom
set splitbelow splitright

" Vertical movements
nnoremap <C-D> <C-D>zz
nnoremap <C-U> <C-U>zz
nnoremap n nzz
nnoremap N Nzz

nnoremap <C-L> :tabnext<CR>
nnoremap <C-H> :tabprevious<CR>

" Line numbers
set nu
set rnu

" Do vertical selection
nnoremap tt <C-V>
nnoremap Q <C-V>

" Editor hotkeys
" Exit Vim
nnoremap <C-J> :q!<CR>

" Saving the file
nnoremap <C-S> :w<CR>

" Remap Space in insert mode to %
map <Space> %

" Replace all instances of text
nnoremap \ :%s//gc<Left><Left><Left>

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

" Abbreviations
func Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc
iab sha #!/bin/bash<CR><C-R>=Eatchar('\s')<CR><CR><C-R>=Eatchar('\s')<CR>
