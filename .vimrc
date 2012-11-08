" Modeline and Notes {
"   vim: set foldmarker={,} foldlevel=0 spell:
"

set nocompatible " explicitly get out of vi-compatible mode

filetype off

set rtp+=~/vimfiles/bundle\vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/slimv.vim'
Bundle 'vim-scripts/matlab.vim'
Bundle 'vim-scripts/VimClojure'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'sophacles/vim-bundle-sparkup'
Bundle 'shougo/neocomplcache'






let mapleader = ","

let g:clj_paren_rainbow=1
let g:neocomplcache_enable_at_startup = 1

set fencs=ucs-bom,utf-8,ucs-2le,defaul,latin1

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>p gqap
nmap <silent> <leader>cl mggg=G:%s/[ \t]*$//g`gk<CR>
nmap <silent> <leader>ca gg^yG<CR>

" Omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
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
set clipboard+=unnamed " share windows clipboard
set directory=~/vimfiles/tmp " directory to place swap files in
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
set listchars=tab:>-,trail:-,extends:#,nbsp:- " show tabs and trailing
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
" Notes {
" I consider .notes files special, and handle them differently, I
" should probably put this in another file
au BufRead,BufNewFile *.notes set foldlevel=2
au BufRead,BufNewFile *.notes set foldmethod=indent
au BufRead,BufNewFile *.notes set foldtext=foldtext()
au BufRead,BufNewFile *.notes set listchars=tab:\ \
au BufRead,BufNewFile *.notes set noexpandtab
au BufRead,BufNewFile *.notes set shiftwidth=8
au BufRead,BufNewFile *.notes set softtabstop=8
au BufRead,BufNewFile *.notes set tabstop=8
au BufRead,BufNewFile *.notes set syntax=notes
au BufRead,BufNewFile *.notes set nocursorcolumn
au BufRead,BufNewFile *.notes set nocursorline
au BufRead,BufNewFile *.notes set guifont=Consolas:h12
au BufRead,BufNewFile *.notes set spell
" }
au BufNewFile,BufRead *.ahk setf ahk
" }

" Vimclojure settings{
    let vimclojure#HighlightBuiltins = 1
    let vimclojure#ParenRainbow  = 1
    let vimclojure#WantNailgun   = 1
    let vimclojure#NailgunClient ="ng"

" }

" GUI Settings {
if has("gui_running")
    " Basics {
    colorscheme slate " my color scheme (only works in GUI)
    set guifont=Consolas:h10 " My favorite font
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
    map <F9> <ESC>:set guifont=Consolas:h10<CR>
    map <F10> <ESC>:set guifont=Consolas:h12<CR>
    map <F11> <ESC>:set guifont=Consolas:h16<CR>
    " }
endif
" }

