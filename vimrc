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

" Go to next and previous tabs by pressing Ctrl + Arrows
	nnoremap <C-Left> :tabprevious<CR>
	nnoremap <C-Right> :tabnext<CR>

" Set normal tabs
    set tabstop=4
    set shiftwidth=4
    set expandtab

" Do operations inside file
    nnoremap yif ggyG<C-O><C-O>
    nnoremap dif ggdG
    nnoremap cif ggcG
    nnoremap vif vGogg

" YAML indentation support
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" --- Same as ideavim ---

" Replace all instances of S
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

" Set line numbers
    set nu
    set rnu

" Remap Space in insert mode to %
    map <Space> %
