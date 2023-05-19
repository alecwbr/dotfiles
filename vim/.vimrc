set termguicolors
colorscheme jellybeans

syntax on
set number
set relativenumber

" size of a hard tabstop
set tabstop=4

" always uses spaces instead of tab characters
set expandtab

" size of an indentation
set shiftwidth=4

" double h key press in quick succession exits insert mode
inoremap hh <esc>

"hi LineNr ctermfg=yellow

" status bar
set laststatus=2
set statusline=
set statusline+=%#DiffChange#
set statusline+=\ %F\   "file+path
set statusline+=%#DiffAdd#
set statusline+=\ %y\   "file type
set statusline+=%#Conditional#
set statusline+=\ %m\   "modified
set statusline+=%#Pmenu#
set statusline+=%=      "align right
set statusline+=%#Function#
set statusline+=\ %{&ff}\   "encoding
set statusline+=\ %l/%L\    "currentline/totallines
set statusline+=\ (%p%%)\   "file percentage
set statusline+=\ 0%v\   "virtual column

call plug#begin()

Plug 'lifepillar/vim-colortemplate'

call plug#end()
