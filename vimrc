" General
set number
set relativenumber
set encoding=utf8
set title

" Theming
syntax on
syntax enable
set cursorline
colorscheme desert

" Backups
set nobackup
set nowb
set noswapfile

" Tab
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set expandtab
filetype plugin indent on

" Undo
set undofile
set history=700
set undodir=$HOME/.vimundo

" NetRW && Files
set wildmenu
set wildignore+=*.pyc
set path+=**

" Shortcuts
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
imap jj <Esc>
