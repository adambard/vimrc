" Modeline and Notes {
"   vim: set foldmarker={,} foldlevel=0 spell:
"

set nocompatible " explicitly get out of vi-compatible mode

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

au!

Plugin 'gmarik/vundle'

Plugin 'Shougo/vimproc'

" Git Helpers
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim.git'
Plugin 'airblade/vim-gitgutter.git'

"Completion Utils
Plugin 'tpope/vim-surround'
Plugin 'shougo/neocomplcache'
Plugin 'sophacles/vim-bundle-sparkup'

" Syntax highlighting plugsns
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8.git'

"Language support
Plugin 'vim-scripts/matlab.vim'
Plugin 'kchmck/vim-coffee-script.git'
Plugin 'juvenn/mustache.vim'
Plugin 'rosstimson/scala-vim-support'


" Clojure support
Plugin 'tpope/vim-fireplace.git'
Plugin 'tpope/vim-classpath.git'
Plugin 'guns/vim-clojure-static'
Plugin 'kovisoft/paredit'

" Respect .editorconfig files
Plugin 'editorconfig/editorconfig-vim'

" Color Schemes
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'

" Docs
Plugin 'rizzatti/dash.vim'

" Typescript
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'





let mapleader = ","

let g:clj_paren_rainbow=1
let g:neocomplcache_enable_at_startup = 0

let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.


set fencs=ucs-bom,utf-8,ucs-2le,defaul,latin1

" Leader commands {

" ,ev: Edit vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
" ,sv: Source vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR>
", st: toggle syntastic and gitgutter (for performance)
nmap <silent> <leader>st :SyntasticToggleMode<CR>:ToggleGitGutter<CR>

nmap <silent> <leader>cl mggg=G:%s/[ \t]*$//g`gk<CR>
nmap <silent> <leader>ca gg^yG<CR>

" ,f: Toggle NERDTree
" ,d: Toggle NERDTree in cwd
nmap <silent> <leader>f :NERDTreeToggle<CR>
nmap <silent> <leader>d :NERDTree<CR>

" ,T: Set current CommandT directory to current directory
" ,t: Search for a file in current CommandT directory
let g:cmdt_root=getcwd()
nmap <silent> <leader>T :let g:cmdt_root=getcwd()<CR>
nmap <silent> <leader>t :exe 'CommandT' g:cmdt_root<CR>

nmap <silent> <leader>d :Dash<CR>

" }

" Make search advanced by default
nnoremap / /\v
vnoremap / /\v

" Omnicomplete
let g:jedi#auto_initialization = 0
let g:jedi#popup_on_dot = 0
autocmd  FileType python let b:did_ftplugin = 1
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete


" Basics {
set noexrc " don't use local version of .(g)vimrc, .exrc
set background=dark " we plan to use a dark background
syntax on " syntax highlighting on
" }

" General {
filetype plugin indent on " load filetype plugins/indent settings
set autochdir " always switch to the current file directory
set backspace=indent,eol,start " make backspace a more flexible
set nobackup " don't make backup files
"set backupdir='C:\Documents and Settings\abard\vimfiles\backup' " where to put backup files
if $TMUX == ''
    set clipboard+=unnamed
endif
set directory=~/.vim/tmp " directory to place swap files in
set fileformats=unix,dos " support all three, in this order
set hidden " you can change buffers without saving
" (XXX: #VIM/tpope warns the line below could break things)
set iskeyword+=_,$,@,%,# " none of these are word dividers
set mouse=a " use mouse everywhere
set noerrorbells " don't make noise
set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
"             | | | | | | | | |
"             | | | | | | | | +-- "]" Insert and Replace
"             | | | | | | | +-- "[" Insert and Replace
"             | | | | | | +-- "~" Normal
"             | | | | | +-- <Right> Normal and Visual
"             | | | | +-- <Left> Normal and Visual
"             | | | +-- "l" Normal and Visual (not recommended)
"             | | +-- "h" Normal and Visual (not recommended)
"             | +-- <Space> Normal and Visual
"             +-- <BS> Normal and Visual
set wildmenu " turn on command line completion wild style
" ignore these list file extensions
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,
            \*.jpg,*.gif,*.png
set wildmode=list:longest " turn on wild mode huge list
" }

" Vim UI {
set laststatus=2 " always show the status line
set lazyredraw " do not redraw while running macros
set linespace=0 " don't insert any extra pixel lines
" betweens rows
set list " we do what to show tabs, to ensure we get them
" out of my files
set listchars=tab:>·,trail:·,extends:#,nbsp:· " show tabs and trailing
set matchtime=5 " how many tenths of a second to blink
" matching brackets for
set nostartofline " leave my cursor where it was
set number " turn on line numbers
set numberwidth=5 " We are good up to 99999 lines
set ruler " Always show current positions along the bottom
set scrolloff=10 " Keep 10 lines (top/bottom) for scope
set shortmess=aOstT " shortens messages to avoid
" 'press a key' prompt
set showcmd " show the command being typed
set showmatch " show matching brackets
set sidescrolloff=10 " Keep 5 lines at the size
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current
"              | | | | |  |   |      |  |     |       column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in
"              | | | | |  |   |          square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer
" }

" Text Formatting/Layout {
set completeopt= " don't use a pop up menu for completions
set expandtab " no real tabs please!
set formatoptions=rq " Automatically insert comment leader on return,
" and let gq format comments
set ignorecase " case insensitive by default
set infercase " case inferred by default
set nowrap " do not wrap line
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set smartcase " if there are caps, go case-sensitive
set shiftwidth=4 " auto-indent amount when using cindent,
" >>, << and stuff like that
set softtabstop=4 " when hitting tab or backspace, how many spaces
"should a tab be (see expandtab)
set tabstop=8 " real tabs should be 8, and they will show with
" set list on
set pastetoggle=<F2>
" }

" Plugin Settings {
let b:match_ignorecase = 1 " case is stupid
let perl_extended_vars=1 " highlight advanced perl vars
" inside strings

" }


" Mappings {
" ROT13 - fun
map <F12> ggVGg?


" space / shift-space scroll in normal mode
noremap <S-space> <C-b>
noremap <space> <C-f>

" }

" Autocommands {
" Ruby {
" ruby standard 2 spaces, always
au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2
au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2
" }

" JS/Typescript {
" 2 spaces, again
au BufRead,BufNewFile *.js,*.ts,*.tsx set shiftwidth=2
au BufRead,BufNewFile *.js,*.ts,*.tsx set softtabstop=2
" }

" Python {
" PEP #whatever demands 4 spaces 
au BufRead,BufNewFile *.py set shiftwidth=4
au BufRead,BufNewFile *.py set softtabstop=4
" }

" }

" Vimclojure settings{
    let vimclojure#HighlightBuiltins = 1
    let vimclojure#ParenRainbow  = 1
    let vimclojure#WantNailgun   = 1
    let vimclojure#NailgunClient ="ng"

" }

" Syntastic settings {
    let g:syntastic_python_checker_args='--ignore=E501'
" }

" GUI Settings {
if has("gui_running")
    " Basics {
    colorscheme slate " my color scheme (only works in GUI)
    "set guifont=Consolas:h10 " My favorite font
    set guioptions=ce
    "              ||
    "              |+-- use simple dialogs rather than pop-ups
    "              +  use GUI tabs, not console style tabs
    set mousehide " hide the mouse cursor when typing
    " }
    " Explore! "
    map <silent> <F8> :Explore<CR>
    map <silent> <S-F8> :Sexplore<CR>
    " Font Switching Binds {
    map <F9> <ESC>:set guifont=Monospace\ 10<CR>
    map <F10> <ESC>:set guifont=Monospace\ 12<CR>
    map <F11> <ESC>:set guifont=Monospace\ 16<CR>
    " }
endif
" }

