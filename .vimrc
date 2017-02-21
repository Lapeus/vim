" SCRIPTS {{{

"dein Scripts {{{ 
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/wolfma/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/wolfma/.local/share/dein')
  call dein#begin('/home/wolfma/.local/share/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/wolfma/.local/share/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('christoomey/vim-tmux-navigator')
<<<<<<< HEAD
  call dein#add('vim-latex/vim-latex')
  call dein#add('ctrlpvim/ctrlp.vim')
=======
>>>>>>> 3cafd2cd8819575013f97038fa6815a88d1788d6
  call dein#add('scrooloose/nerdtree')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" }}}

" }}}

" LATEX-SUITE {{{
     " REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
    filetype plugin on
    
    " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
    " can be called correctly.
    set shellslash
    
    " IMPORTANT: grep will sometimes skip displaying the file name if you
    " search in a singe file. This will confuse Latex-Suite. Set your grep
    " program to always generate a file-name.
    set grepprg=grep\ -nH\ $*
    
    " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
    " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
    " The following changes the default filetype back to 'tex':
    let g:tex_flavor='latex'
" }}}


" NORMAL {{{

    set modeline

" appearance {{{
    set t_Co=256
    colorscheme goodwolf
" }}}
" Misc {{{
    set ttyfast                     " faster redraw
    set backspace=indent,eol,start  " ?
" }}}
" Spaces & Tabs {{{
    set tabstop=4           " 4 space tab
    set expandtab           " use spaces for tabs
    set softtabstop=4       " 4 space tab
    set shiftwidth=4        "  
    set modelines=1         " 
    filetype indent on      " 
    filetype plugin on      " 
    set autoindent          " 
" }}}
" UI Layout {{{
    set number              " show line numbers
    set showcmd             " show command in bottom bar
    set cursorline          " highlight current line
    set cursorcolumn        " highlight current column
    set wildmenu            " nice menu for <TAB>-Completion
    set lazyredraw          " sth for optimzing reload
    set showmatch           " higlight matching parenthesis
" }}}
" Searching {{{
    set ignorecase          " ignore case when searching
    set incsearch           " search as characters are entered
    set hlsearch            " highlight all matches
" }}}
"Suppose you want Folding {{{
    set foldmethod=indent   " fold based on indent level
    set foldnestmax=10      " max 10 depth
    set foldenable          " don't fold files by default on open
    set foldlevelstart=10   " start with fold level of 1
" }}}

" }}}

" KEYMAPPINGS {{{
    nnoremap <space> za     " map za to SPACE nice one
    map <C-n> :NERDTreeToggle<CR>
" }}}

" TESTING CONFIGS {{{
"The following three lines map Ctrl+s to save in vi.  You can comment 
"these out, it has nothing to do with syntax highlighting or colors.

" optional lines to turn on pressing F2 to toggle paste mode
noremap <F2> :set invpaste paste?<CR>i
set pastetoggle=<F2>



syntax on
set background=dark
set hlsearch
set nu
" set smartindent  "smartindent doesn't take care of python hashtag comments correctly, use cindent:    
set cindent
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
filetype on
filetype plugin indent on

au BufReadPost,BufNewFile *.twig colorscheme koehler 
au BufReadPost,BufNewFile *.css colorscheme slate
au BufReadPost,BufNewFile *.js colorscheme slate2
au BufReadPost,BufNewFile *.py colorscheme molokaiyo
au BufReadPost,BufNewFile *.html colorscheme monokai
au BufReadPost,BufNewFile *.java colorscheme monokai
" au BufReadPost,BufNewFile *.php colorscheme monokai

" Default line highlighting for unknown filetypes
hi String ctermfg=140
hi CursorLine ctermbg=235
hi CursorLine guibg=#D3D3D3 cterm=none

"What follows are optional things, I like them

"au BufNewFile,BufRead *.py 
"        \ set tabstop=4 
"        \ set shiftwidth=4     "aand fedora doesn't like this parameter, remove this line.
"        \ set textwidth=79 
"        \ set expandtab 
"        \ set autoindent 
"        \ set fileformat=unix

" Commenting blocks of code.
" This specifies the comment character when specifying block comments.
"autocmd FileType c,cpp,java,scala let b:comment_leader = '//'
autocmd FileType sh,ruby,python   let b:comment_leader = '#'
autocmd FileType conf,fstab       let b:comment_leader = '#'
autocmd FileType tex              let b:comment_leader = '%'
autocmd FileType mail             let b:comment_leader = '>'
autocmd FileType vim              let b:comment_leader = '"'

"this makes it so you can Shift-V highlight lots of text then press ,cc to
"comment it or ,cu to uncomment.  
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

"This mission critical workaround hack tells vim to restore cursor to the last line.
"Be sure to set: "Thip, crinkle, sploit" to "stopit, just be right".  lolz
"Also it could be the functionality is disabled in your /etc/vim/vimrc or 
"your ~/.viminfo is owned by root.  
"http://askubuntu.com/questions/223018/vim-is-not-remembering-last-position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

"These extra commands tell syntastic to ignore the following kinds of warnings                                                               
"let g:syntastic_quiet_messages = { "regex": 'superfluous' }
"let g:syntastic_quiet_messages = { "regex": 'superfluous-parens\|too-many-instance-attributes\|too-few-public-methods' }

"I like the vertical bar on insert mode, others do not like.  You decide.
"let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
"let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
" }}}

" vim: foldmethod=marker:foldlevel=0
