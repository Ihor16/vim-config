" Configuration that adds Vim extensions and local-specific setup,
" so it requires external dependencies

" Yank
if system('uname -r') =~ "microsoft"
  augroup Yank
  autocmd!
  " autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
  " autocmd TextYankPost * :call system('/mnt/d/Install/win-yank/win32yank-x64/win32yank.exe -i',@")
  autocmd TextYankPost * :call system('win32yank.exe -i',@")
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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
call plug#end()

" Coc
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Coc: Get function definition
nnoremap <S-K> :call CocAction('doHover')<CR>
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-clangd',
  \ 'coc-go',
  \ 'coc-phpls',
  \ 'coc-docker'
  \ ]
let g:coc_suggest_disable = 1
let g:coc_start_at_startup = v:true

" Coc: Trigger autocomplete with ctrl-space
inoremap <silent><expr> <c-space> coc#refresh()

" Coc: Go to function definition and implementation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gf :call CocAction('jumpDefinition', 'tabe')<CR>
nmap <silent> gl :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gi <Plug>(coc-implementation)

" Coc: Optimize imports
nmap go :call CocAction('runCommand', 'editor.action.organizeImport')<CR>

" Open preview in new window below
nmap gk K<C-W>w<C-W>s<C-W>k<C-W>j

" Gitgutter: View git changes
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1
set updatetime=250

" Gruvbox: Startup
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_guisp_fallback = 'bg'
colorscheme gruvbox
set background=dark
" nnoremap <leader>0 :hi Normal guibg=NONE ctermbg=NONE<CR>
hi Normal guibg=NONE ctermbg=NONE

" FZF: Search by file
nnoremap <C-P> :Files<CR>
nnoremap <C-N> :Files<CR>

" FZF: Search by content
nnoremap <leader>\ :Rg<CR>

" FZF: Opening files
let g:fzf_action = {
  \ 'Enter': 'tab split',
  \ 'ctrl-h': 'e',
  \ 'ctrl-o': 'vsplit',
  \ 'ctrl-l': 'vsplit',
  \ 'ctrl-s': 'sp' }

" FZF: Open vim buffers
nmap <silent> gb :Buffers<CR><CR><CR>

" LanguageClient: Startup
let g:LanguageClient_serverCommands = {
    \ 'sh': ['bash-language-server', 'start']
    \ }
let g:LanguageClient_autoStart = 0

" LanguageClient: Enable and disabled
nnoremap tl :LanguageClientStart<CR>
nnoremap ts :LanguageClientStop<CR>

" Change spell language
nnoremap <C-F> :set spelllang=fr<CR>

