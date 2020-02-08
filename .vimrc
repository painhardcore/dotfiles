
set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin indent on     " required

"
:"" Settings
"
set noerrorbells                " No beeps
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.

set noswapfile                  " Don't use swapfile
set nobackup					          " Don't create
"annoying backup files
set nowritebackup
set splitright                  " Split vertical windows right to the current
"windows
set splitright                  " Split horizontal windows below to the
"current windows
set encoding=utf-8              " Set default encoding to UTF-8
"set autowrite                   " Automatically save before :next, :make etc.
"set autoread                    " Automatically reread changed files without
"asking me anything
set laststatus=2
set hidden
"
set ruler                       " Show the cursor position all the time
"au FocusLost * :wa              " Set vim to save the file on focus out.
"
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
"
"set noshowmatch                 " Do not show matching brackets by flickering
"set noshowmode                  " We show the mode with airline or lightline
"set incsearch                   " Shows the match while typing
"set hlsearch                    " Highlight found searches
"set ignorecase                  " Search case insensitive...
"set smartcase                   " ... but not when search pattern contains
"upper case characters
"set ttyfast
"" set ttyscroll=3               " noop on linux ?
set lazyredraw          	      " Wait to redraw "

" speed up syntax highlighting
" set nocursorcolumn
" set nocursorline
"

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
call plug#end()
