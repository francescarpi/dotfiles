" Neovim configuration
"
" Install vim-plug
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
call plug#begin('~/.local/share/nvim/plugged')
Plug 'ellisonleao/gruvbox.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" theme
set background=dark
colorscheme gruvbox
" colorscheme nightfox

" line number
set relativenumber
set cursorline

" wildmenu
set wildmenu
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*
set wildignore+=.venv/*

" tabs
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
