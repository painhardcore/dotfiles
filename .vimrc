
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
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without
"asking me anything
set laststatus=2
set hidden
"
set ruler                       " Show the cursor position all the time
"au FocusLost * :wa              " Set vim to save the file on focus out.
"
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set updatetime=100
"
"set noshowmatch                 " Do not show matching brackets by flickering
"set noshowmode                  " We show the mode with airline or lightline
"set incsearch                   " Shows the match while typing
"set hlsearch                    " Highlight found searches
"set ignorecase                  " Search case insensitive...
"set smartcase                   " ... but not when search pattern contains
"upper case characters
set ttyscroll=3               " noop on linux ?
set lazyredraw          	      " Wait to redraw "

" speed up syntax highlighting
set nocursorcolumn
set nocursorline

let mapleader = "," " easy shortcuts, instead of \

" Rust
let g:rustfmt_autosave = 1
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" Golang
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_snippet_case_type = "camelcase"
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_fmt_fail_silently = 1
let g:go_metalinter_deadline = "15s"
let g:go_metalinter_autosave_enabled = ['vet']
let g:go_metalinter_autosave = 1
let g:go_def_mode = 'gopls'
let g:go_rename_command = 'gopls'
let g:go_info_mode='gopls'
"shows :GoInfo whereever the cursor moves to
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1
" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
"  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
"\}

"errors
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
nnoremap <leader>x :ccl <bar> lcl<CR>
" run and build 
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

"Misc
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
let g:deoplete#enable_at_startup = 1
nmap <F8> :TagbarToggle<CR>
"NERDTREE
map <C-n> :NERDTreeToggle<CR>

" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
"
call plug#begin('~/.vim/plugged')
"theme
Plug 'fatih/molokai'
"
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
" RUST
Plug 'rust-lang/rust'
Plug 'vim-syntastic/syntastic'
Plug 'majutsushi/tagbar'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

" GO
Plug 'fatih/vim-go' 
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'buoto/gotests-vim'
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Misc
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'martinda/Jenkinsfile-vim-syntax'
call plug#end()
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai
set completeopt=noselect
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
