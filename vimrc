" General {{{

" Tabs {{{

" Tabs are 2 characters
set tabstop=4

" (Auto)indent uses 2 characters
set shiftwidth=4
set softtabstop=4

" spaces instead of tabs
set expandtab

" }}}

" Search {{{

" highlight the searchterms
set hlsearch

" jump to the matches while typing
set incsearch

" ignore case while searching
set ignorecase

" execpt when searching for upper case
set smartcase

" }}}

" enable all features
set nocompatible

" do not wrap long lines
set nowrap

" guess indentation
set autoindent
" set smartindent

" don't reset cursor to start of line when moving around
set nostartofline

" show line numbers
set number

" better when pasting text into vim
set pastetoggle=<F2>

" fold using {{{ }}}
set foldmethod=marker

" open folds when searching, etc...
set foldopen=jump,mark,search,tag,undo

" powerful backspaces
set backspace=indent,eol,start

" don't wrap words
set textwidth=0

" history
set history=50

" 1000 undo levels
set undolevels=1000

" persistent undo
set undofile

" show a ruler
set ruler

" show partial commands
set showcmd

" show matching braces
set showmatch

" highlight current line
set cursorline

" leave 4 lines on top or bottom when scrolling
set scrolloff=4
set sidescrolloff=4

" when buffer is brought to foregroup, remember undo history and marks
set hidden

" copy and paste across terminals
set clipboard=unnamed

" auto-detect the filetype
filetype plugin indent on

" look in current directory for 'tags',
" and work up the tree towards root until
" one is found
set tags=./tags;/

" }}}

" Tab completion {{{

" Always show the menu, insert longest match
set completeopt=menuone,longest

" Expand the command line using tab
set wildchar=<Tab>
set wildmode=longest:full
set wildmenu

" tab complete text
set omnifunc=syntaxcomplete#Complete

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1
" http://tex.stackexchange.com/questions/62134/how-to-disable-all-vim-latex-mappings
let g:Imap_UsePlaceHolders = 0
let g:Tex_SmartKeyDot=0

"}}}

" Title bar {{{

let &titleold=getcwd()
set titlestring=%t

if &term == "screen" || &term == "screen-bce" || &term == "screen-256color"
  set t_ts=k
  set t_fs=\
endif
if &term == "screen" || &term == "screen-bce" || &term == "screen-256color" || &term == "xterm"
  set title
endif

" }}}

" Keybindings {{{

" change leader key to comma
let mapleader=","

" better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

command WQ wq
command Wq wq
command W w
command Q q

" save document after entering command mode
imap jj <ESC>:w<Cr>

" force write permissions with sudo
cmap w!! w !sudo tee >/dev/null %

" replace highlighted text
vnoremap <C-r> y:%s/\<<C-r>"\>//g<Left><Left>

" yank from cursor to end of line
nnoremap Y y$

" Gundo toggle
nnoremap <F5> :GundoToggle<CR>

" tabular shortcuts
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" }}}

" Color {{{

" syntax highlight
syntax on

" enable 256 bit color mode
set t_Co=256

" use dark color scheme
set bg=dark

" some nice color schemes
let g:solarized_termcolors=256
let g:solarized_termtrans=1

" highlight white trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" }}}

" Status Line {{{

" powerline plugin needs two lines
set laststatus=2

" encoding
set encoding=utf-8

let g:Powerline_symbols = "compatible"

" }}}

" hide toolbar in GUI mode
if has("gui_running")
    set go-=T
end

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

source $HOME/.vim/bundles.vim
