" Vundle Set-up
set nocompatible                            " be iMproved, required
filetype off                                " required

set wrap                                    " Set Line wrap ON
set number                                  " Set Line numbers ON
syntax enable                               " Enable syntax highlighting
set ignorecase                              " Ignore case in search
set scrolloff=10                            " Keep cursor 10 off edge of screen
set wildmode=longest,list                   " Autocomplete to longest, list
set wildmenu                                " Add menu to bottom of vim
set encoding=utf-8                          " utf-8 encoding
set wildignore+=*.swp,.git,*.svn,cover_db   " Ignore rubbish files
set mouse=a                                 " Use mouse for stuff
set history=1000                            " History of 1000
set showmode                                " Shows mode
set nofoldenable                            " Default folds are open when file is opened. Renable folds with zc

set virtualedit=block                       " Select any character in visual block mode

set laststatus=2                            " Always have status line
set hlsearch                                " highlight all search results
set incsearch

set autoindent                              " Copy indent from previous line
set shiftwidth=4                            " Tab size = 4 spaces
set expandtab                               " Tabs are made of 4 spaces
set tabstop=4                               " Tab size = 4 spaces
set softtabstop=4                           " Tab size = 4 spaces (AGAIN)
set linebreak                               " Show linebreaks (visual only)

set complete=.,w,b,t                        "

set hidden

set splitbelow                              " Splits to below instead of above
set splitright                              " Splits to right rather than left

set rtp+=~/.vim/bundle/Vundle.vim           " set the runtime path to include Vundle and initialize
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'               " let Vundle manage Vundle, required
Plugin 'sickill/vim-monokai'                " Monokai colorscheme
Plugin 'Valloric/YouCompleteMe'             " YouCompleteMe
Plugin 'scrooloose/nerdtree'                " Nerdtree for file browsing
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'               " Automatic parenthesis closing
Plugin 'tpope/vim-fugitive'                 " Git integration
Plugin 'godlygeek/tabular'                  " Tabulate stuff
Plugin 'bling/vim-airline'                  " Status bar at bottom of window
Plugin 'ctrlpvim/ctrlp'                     " Fuzzy file finder in vim
Plugin 'tmhedberg/SimpylFold'               " Python indentation

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax enable
colorscheme monokai                         " Use monokai colour theme

" NERDTree
let NERDTreeShowBookmark=1		            " Show bookmarks table on startup
let NERDTreeQuitOnOpen=1		            " Close Nerd Tree after opening file
let NERDTreeIgnore=['\.pyc$','\~$']	        " Ignore pyc and $ files
autocmd vimenter * NERDTree                 " Automatically start Nerdtree

" Automatically start nerdtree when opening folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
nmap § :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" DelimiteMate Setup
let delimitMate_expand_space=1		        " Expand <space> inside empty delimiters
let delimitMate_expand_cr=1		            " Expand <cr> inside empty delimiters

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled=0

" Ctrl-P
let g:ctrlp_dotfiles=1			           " Dotfiles
let g:ctrlp_max_files=1000		           " Max files=1000
let g:ctrlp_max_depth=10		           " 10
let g:ctrlp_open_new_file='v'		       " v To open new file
let g:ctrlp_open_multiple_files='3vr'	   " 3vr to open multiple files

" Enable tabline (airline)
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#branch#format=1
let g:airline_section_y=''
let g:airline_section_c='%t'

" Simple Fold
let g:SimpylFold_docstring_preview=1
