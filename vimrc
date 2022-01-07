runtime! debian.vim

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" ### Common ### "

" Colorscheme by default
colorscheme desert

" YAML indentation support
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufEnter *.yml colorscheme default
autocmd BufEnter *.yaml colorscheme default

" Go to next and previous tabs by pressing CTRL+L or H
nnoremap <C-L> :tabnext<CR>
nnoremap <C-H> :tabprevious<CR>

" Set tabs to be normal size
set tabstop=4
set shiftwidth=4
set expandtab

" Do operations inside file
nnoremap yif ggyG<C-O>
nnoremap dif ggdG
nnoremap cif ggcG
nnoremap vif vGogg

" Searching
set path+=**

" --- File Explorer ---
" Open file explorer
nnoremap <C-Z> :E<CR>

" Open file on the right side when splitting
let g:netrw_altv=1 
" Refresh files
nmap <unique> ,<C-R> <Plug>NetrwRefresh

" ### Same as ideavim ### "

" Set line numbers
set nu
set rnu

" Remap Space in insert mode to %
map <Space> %

" Replace all instances of text
nnoremap S :%s//gc<Left><Left><Left>

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

" Do operations inside ()
nnoremap cb f(cib
nnoremap db f(dib
nnoremap yb f(yib
nnoremap vb f(vib

" Do backwards operations
nnoremap dr bde
nnoremap cr bce
nnoremap yr bye
nnoremap vr bve

