set encoding=utf-8
set nu
set fileencodings=utf-8
set tabstop=2
set shiftwidth=2
set expandtab
set splitright
set syntax=on
set relativenumber

"<Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

au BufRead,BufNewFile *.nibi set filetype=nibi
au Syntax nibi runtime! syntax/nibi.vim

call plug#begin("/home/bosley/.config/nvim/plugged")

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

call plug#end()

lua require("init")

