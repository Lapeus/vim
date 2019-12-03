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

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Load plugins here (pathogen/vundle/vim-plug)

if empty(glob('C:Users/mwolf/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ALE settings
" let g:ale_fixers = {
"             \   'python': ['autopep8'],
"             \   'javascript': ['eslint', 'remove_trailing_lines', 'trim_whitespace'],
"             \   'html':['tidy'],
"             \}

call plug#begin('C:\Users\wolfma\.vim\plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " This is some fiesta / with manual .exe copying
Plug 'junegunn/fzf.vim' " Super nice Fuzzy Finder WoW
"Plug 'terryma/vim-multiple-cursors' " Multi Cursor Support
Plug 'w0rp/ale' " linter ALE
Plug 'itchyny/lightline.vim' " Status line visual aid
Plug 'scrooloose/nerdtree' " Nerdtree
Plug 'altercation/vim-colors-solarized' " Nerdtree
" Testing new stuff 03.10.2019
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'ycm-core/YouCompleteMe' 

call plug#end()


" BACKGROUND FILES
silent execute '!mkdir "'.$HOME.'/temp"'
silent execute '!del "'.$HOME.'/temp/*~"'
set backupdir=$HOME/temp//
set directory=$HOME/temp//

" For plugins to load correctly
filetype plugin indent on

" omnicompletion
set omnifunc=syntaxcomplete#Complete

" visible lines from collapsed open buffer
set winminheight=0

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
" set wrap
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


" Allow hidden buffers
set hidden

" Rendering
"set ttyfast

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

" Strip all whitespaces on save
"autocmd BufWritePre * %s/\s\+$//e

" Visualize tabs and newlines
set listchars=tab:?\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default

" Color scheme (terminal)
colorscheme solarized
set background=dark
" Turn on syntax highlighting
syntax enable

" commands
command! Setroot lcd %:p:h



"------------------------------------------------------------------------------
" MAPPINGS
"------------------------------------------------------------------------------

" leader key
let mapleader = ","

" NORMAL MODE MAPPINGS
" clear search result markers
nnoremap <leader><space> :let @/=''<cr> " clear search
" Or use your leader key + l to toggle on/off
nnoremap <leader>l :set list!<CR> " Toggle tabs and EOL
" Formatting
nnoremap <leader>q gqip
" Navigate open buffers
nnoremap <C-j> <C-w>j<C-w><S-_>
nnoremap <C-k> <C-w>k<C-w><S-_>
nnoremap <C-h> <C-w>h<C-w><S-_>
nnoremap <C-l> <C-w>l<C-w><S-_>
" Navigate open tabs
nnoremap <C-Left> <C-w>:tabp<CR>
nnoremap <C-Right> <C-w>:tabn<CR>
" Move to first Tab
nnoremap <F8> gt
" Move up/down editor lines
nnoremap j gj
nnoremap k gk
" paste from system buffer
nnoremap <C-p> "+p
" yank to system buffer
nnoremap <C-y> "+y

" TERMIAL MODE MAPPINGS
" Navigate open buffers
tnoremap <C-j> <C-w>j<C-w><S-_>
tnoremap <C-k> <C-w>k<C-w><S-_>
tnoremap <C-h> <C-w>h<C-w><S-_>
tnoremap <C-l> <C-w>l<C-w><S-_>
" Navigate open tabs
tnoremap <C-Left> <C-w>:tabp<CR>
tnoremap <C-Right> <C-w>:tabn<CR>

" VISUAL MODE MAPPING
" paste from system buffer
vnoremap <C-p> "+p
" yank to system buffer
vnoremap <C-y> "+y



"------------------------------------------------------------------------------
" NERDTREE
"------------------------------------------------------------------------------
" Shortcut opening nerdtree
map <C-n> :NERDTreeToggle<CR>


"------------------------------------------------------------------------------
" COC
"------------------------------------------------------------------------------
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=1

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <C-d> <Plug>(coc-range-select)
"xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


"------------------------------------------------------------------------------
" FILETYPE SPECIFIC
"------------------------------------------------------------------------------
" html
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
