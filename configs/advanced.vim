" Configuration that adds Vim extensions and local-specific setup,
" so it requires external dependencies

" Yank
if system('uname -r') =~ "microsoft"
  augroup Yank
  autocmd!
  " autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
  autocmd TextYankPost * :call system('/mnt/d/Install/win-yank/win32yank-x64/win32yank.exe -i',@")
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

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-clangd',
  \ 'coc-go',
  \ 'coc-phpls',
  \ 'coc-docker'
  \ ]
let g:coc_suggest_disable = 1

Plug 'airblade/vim-gitgutter'
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

let g:gitgutter_override_sign_column_highlight = 1
" let g:coc_start_at_startup = v:false

set updatetime=250
call plug#end()

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Coc
" Get function definition
nnoremap <S-K> :call CocAction('doHover')<CR>

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
  \ 'ctrl-s': 'sp',
  \ 'ctrl-e': 'vsplit' }

" Language servers
let g:LanguageClient_serverCommands = {
    \ 'sh': ['bash-language-server', 'start']
    \ }
let g:LanguageClient_autoStart = 0

nnoremap tl :LanguageClientStart<CR>
nnoremap ts :LanguageClientStop<CR>

" Change spell language
nnoremap <C-F> :set spelllang=fr<CR>
