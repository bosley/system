set smarttab
set expandtab   
set tabstop=2    
set softtabstop=2    
set shiftwidth=2    
set smartindent    
set cinoptions+=g0,:0,N-s    
set backspace=indent,eol,start    
set incsearch    
set cursorline    
set splitright    
set ttimeoutlen=0    
set number    
hi LineNr ctermfg=Grey    
hi CursorLineNr ctermfg=DarkGrey    
hi LineNr ctermbg=None    
hi CursorLineNr ctermbg=White    
syntax on    
filetype indent on    
set laststatus=2    
hi Folded ctermbg=None    
hi Folded ctermfg=Magenta    
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>    
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
