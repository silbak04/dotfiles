call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" enable all features
set nocompatible

" Wrap too long lines
set wrap

" Tabs are 2 characters
set tabstop=4

" (Auto)indent uses 2 characters
set shiftwidth=4
set softtabstop=4
set smartindent

" spaces instead of tabs
set expandtab

" guess indentation
set autoindent
set smartindent

" don't reset cursor to start of line when moving around
set nostartofline

" show line numbers
set number

" Fold using markers "{{{
" like this"}}}
" 
set foldmethod=marker

" powerful backspaces
set backspace=indent,eol,start

" highlight the searchterms
set hlsearch

" jump to the matches while typing
set incsearch

" ignore case while searching
set ignorecase

" don't wrap words
set textwidth=0

" history
set history=50

" 1000 undo levels
set undolevels=1000

" show a ruler
set ruler

" show partial commands
set showcmd

" show matching braces
set showmatch

" leave 4 lines on top or bottom when scrolling
set scrolloff=4

" when buffer is brought to foregroup, remember undo history and marks
set hidden

" auto-detect the filetype
filetype plugin indent on

set omnifunc=syntaxcomplete#Complete

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete


" Always show the menu, insert longest match
set completeopt=menuone,longest

" Expand the command line using tab
set wildchar=<Tab>
set wildmode=longest:full
set wildmenu

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

let &titleold=getcwd()
set titlestring=%t 

if &term == "screen" || &term == "screen-bce" || &term == "screen-256color"
  set t_ts=k
  set t_fs=\
endif
if &term == "screen" || &term == "screen-bce" || &term == "screen-256color" || &term == "xterm"
  set title
endif

" faster split resizing
if bufwinnr(1)
    map + <C-W>+
    map - <C-W>-
endif

" better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

command WQ wq
command Wq wq
command W w
command Q q

imap jj <ESC>  

" yank from cursor to end of line
nnoremap Y y$

" syntax highlight
syntax on

" enable 256 bit color mode
set t_Co=256

" use dark color scheme
set bg=dark
               
" some nice color schemes
colorscheme desert256
"colorscheme xoria256


let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1

highlight Pmenu ctermbg=238 gui=bold
