filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'Lokaltog/vim-powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bitc/vim-bad-whitespace'
Bundle 'godlygeek/tabular'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-markdown'
Bundle 'tikhomirov/vim-glsl'
Bundle 'Valloric/YouCompleteMe'
Bundle 'kien/ctrlp.vim'

" re-enable settings that had to be disabled for vundle
filetype plugin indent on

" Powerline
set laststatus=2
set encoding=utf-8
let g:Powerline_symbols = "compatible"

" Solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

" current line highlighting
highlight LineNr ctermbg=0 ctermfg=235

" current line highlighting
highlight CursorLine ctermbg=234

" Gundo toggle
nnoremap <F5> :GundoToggle<CR>

" Tabular shortcuts
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
