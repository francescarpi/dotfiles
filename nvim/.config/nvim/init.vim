" Neovim configuration
"
" Install vim-plug
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" brew install the_silver_searcher
" brew uninstall ctags
" brew install  universal-ctags

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tanvirtin/monokai.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'itchyny/vim-gitbranch'
call plug#end()

" theme
syntax on
colorscheme monokai_pro

" line number
set relativenumber
set cursorline

" wildmenu
set wildmenu
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*,dist/*,.git/*
set wildignore+=.venv/*

" tabs
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set expandtab

" coc
let g:coc_global_extensions = ['coc-eslint', 'coc-pairs', 'coc-pyright', 'coc-tsserver', 'coc-git', '@yaegassy/coc-volar', '@yaegassy/coc-volar-tools']

" search
set ignorecase
noremap <F3> :noh<CR>

" leader key
let mapleader=","

" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" statusline
let g:lightline = {
	\ 'active': {
	\   'left': [ [ 'mode', 'paste'],
	\             [ 'cocstatus', 'readonly', 'filename', 'gitbranch', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status',
    \   'gitbranch': 'gitbranch#name'
	\ },
	\ }
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" fzf maps
nnoremap <leader>ff :GFiles<CR>
nnoremap <leader>ft :BTags<CR>
nnoremap <leader>fta :Tags<CR>
nnoremap <leader>fs :Ag<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>fft :Filetypes<CR>

" coc maps
nnoremap <leader>cc :CocCommand<CR>
nnoremap <leader>cl :CocList<CR>

" chadtree
nnoremap <leader>v <cmd>CHADopen<cr>

" autostart coq
let g:coq_settings = { 'auto_start': v:true }

" change default register
 set clipboard+=unnamedplus

 " color column
 set colorcolumn=120
