" Configuration that adds Vim extensions and local-specific setup,
" so it requires external dependencies

" Yank
if system('uname -r') =~ "microsoft"
  augroup Yank
  autocmd!
  autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
  augroup END
endif

" 24-bit color
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
hi Visual cterm=none ctermbg=darkgrey

" Plugins installation
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call plug#end()

" Gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_guisp_fallback = 'bg'
colorscheme gruvbox
set background=dark

" Plugins configuration
" FZF
nnoremap <C-P> :FZF --tac<CR>
nnoremap <C-N> :FZF --tac<CR>
let g:fzf_action = {
  \ 'Enter': 'tab split',
  \ 'ctrl-s': 'e',
  \ 'ctrl-x': 'vsplit' }

" Language servers
let g:LanguageClient_serverCommands = {
    \ 'sh': ['bash-language-server', 'start']
    \ }
let g:LanguageClient_autoStart = 0

nnoremap tl :LanguageClientStart<CR>
nnoremap ts :LanguageClientStop<CR>

" Change spell language
nnoremap <C-F> :set spelllang=fr<CR>
