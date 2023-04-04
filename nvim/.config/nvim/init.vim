" Neovim configuration
"
" Install vim-plug
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
call plug#begin('~/.local/share/nvim/plugged')
Plug 'ellisonleao/gruvbox.nvim'
Plug 'tpope/vim-commentary'
call plug#end()

" theme
set background=dark
colorscheme gruvbox

" line number
set relativenumber

