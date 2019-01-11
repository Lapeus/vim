" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Load plugins here (pathogen/vundle/vim-plug)

"if empty(glob('C:Users/mwolf/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

" Test
" let g:ale_fixers = {
"             \   'python': ['autopep8'],
"             \   'javascript': ['eslint', 'remove_trailing_lines', 'trim_whitespace'],
"             \   'html':['tidy'],
"             \}

call plug#begin('C:User/mwolf/.vim/plugged')

"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " This is some fiesta / with manual .exe copying
"Plug 'junegunn/fzf.vim' " Super nice Fuzzy Finder WoW
Plug 'itchyny/lightline.vim' " Status line visual aid
"Plug 'terryma/vim-multiple-cursors' " Multi Cursor Support
Plug 'scrooloose/nerdtree' " Nerdtree
"Plug 'w0rp/ale' " linter ALE
Plug 'fcpg/vim-orbital'

call plug#end()

silent execute '!mkdir "'.$HOME.'/temp"'
silent execute '!del "'.$HOME.'/temp/*~"'
set backupdir=$HOME/temp//
set directory=$HOME/temp//

" For plugins to load correctly
filetype plugin indent on

" leader key
let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd
set wildmenu
set wildmode=longest:full,full

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Formatting
map <leader>q gqip
" Strip all whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" Visualize tabs and newlines
set listchars=tab:?\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
colorscheme orbital
" Turn on syntax highlighting
syntax on


" gui specific settings
if has('gui_running')
    " sets fontype and size
    set guifont=Lucida_Console:h11
    " disables all gui-bars
    :set guioptions-=m  "remove menu bar
    :set guioptions-=T  "remove toolbar
    :set guioptions-=r  "remove right-hand scroll bar
    :set guioptions-=L  "remove left-hand scroll bar
endif


" commands
command! Setroot lcd %:p:h

" mappings
set winminheight=0
nnoremap <C-j> <C-w>j<C-w><S-_>
nnoremap <C-k> <C-w>k<C-w><S-_>
nnoremap <C-h> <C-w>h<C-w><S-_>
nnoremap <C-l> <C-w>l<C-w><S-_>
nnoremap <C-Left> <C-w>:tabp<CR>
nnoremap <C-Right> <C-w>:tabn<CR>

tnoremap <C-j> <C-w>j<C-w><S-_>
tnoremap <C-k> <C-w>k<C-w><S-_>
tnoremap <C-h> <C-w>h<C-w><S-_>
tnoremap <C-l> <C-w>l<C-w><S-_>
tnoremap <C-Left> <C-w>:tabp<CR>
tnoremap <C-Right> <C-w>:tabn<CR>
