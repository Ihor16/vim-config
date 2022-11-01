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

" Yank support
if system('uname -r') =~ "microsoft"
  augroup Yank
  autocmd!
  autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
  augroup END
endif

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
hi Visual cterm=none ctermbg=darkgrey

call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf'
call plug#end()

nnoremap <C-P> :FZF --tac<CR>
nnoremap <C-N> :FZF --tac<CR>
let g:fzf_action = {
  \ 'Enter': 'tab split',
  \ 'ctrl-s': 'e',
  \ 'ctrl-x': 'vsplit' }

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_guisp_fallback = 'bg'
colorscheme gruvbox
set background=dark

" ### Common ### "
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Disable status line
set laststatus=1

" Colorscheme by default
" colorscheme desert

" YAML colors
" autocmd BufEnter *.yml colorscheme delek
" autocmd BufEnter *.yaml colorscheme delek

" SH colors
" autocmd BufEnter *.sh colorscheme ron

" No hlsearch
set nohlsearch

" Remapping Y
nnoremap Y Y

" Markdown spell
autocmd BufEnter *.md set spell

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

" Saving the file
nnoremap <C-S> :w<CR>

" Increment by letters as well
" set nrformats+=alpha

" --- File Explorer ---
" Open file on the right side when splitting
let g:netrw_altv=1
" Remove the banner
let g:netrw_banner=0
" Refresh files
nmap <unique> ,<C-R> <Plug>NetrwRefresh

" Leader key
let mapleader = "`"
" set timeoutlen=500

" Working with tabs
nnoremap <leader>h :tabm -1<CR>
nnoremap <leader>l :tabm +1<CR>
nnoremap <leader>j :qa<CR>

" ### Same as ideavim ### "

" Split to the right and bottom
set splitbelow splitright

" Exit Vim
nnoremap <C-J> :q!<CR>

" Set line numbers
set nu
set rnu

" Working with tabs
nnoremap <C-L> :tabnext<CR>
nnoremap <C-H> :tabprevious<CR>

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

" Change spell language
nnoremap <C-F> :set spelllang=fr<CR>

