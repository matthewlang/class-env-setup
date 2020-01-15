set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Style
Plugin 'tpope/vim-sensible'
Plugin 'lifepillar/vim-solarized8'
Plugin 'morhetz/gruvbox'
Plugin 'fatih/molokai'

" Google code format
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'

" Go support
Plugin 'fatih/vim-go'

" YCM
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" END OF VUNDLE

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif


syntax on

" don't use these chars to seperate words
set isk+=_,$,@,%,#,-

" highlight matching parens
set showmatch

set wildmenu
set wildignore=*.o,*~
set wildmode=longest,list

set number
set ruler
setlocal numberwidth=3
set tabstop=2 shiftwidth=2 expandtab

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

autocmd FileType tex set spell

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer autopep8
  " Alternative: autocmd FileType python AutoFormatBuffer yapf
augroup END

set textwidth=80
set formatoptions+=t
set autoindent

" Uncomment for gruvbox theme.
" set background=dark
" colorscheme gruvbox
" let g:gruvbox_italic=1

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

let g:rehash256 = 1

" vim-go stuff
autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 1
set updatetime=100
let g:go_auto_sameids = 1

" keep source trees clean
set backupdir=~/.vimswp
set directory=~/.vimswp
set undodir=~/.vimswp

" relative line numbering
set rnu
