" does w/e
set nocompatible

"set Leader to SPACE
let mapleader=" "

" activates filetype detection
filetype plugin indent on

" activates syntax highlighting among other things
syntax on

" appearance {{{
    set t_Co=256
    colorscheme monokai
" }}}
" Misc {{{
    set modeline                    " expecting a modeline
    set modelines=1                 " 1 modeline
    set hidden                      " nice bufferhandling
    set ttyfast                     " faster redraw
    set backspace=indent,eol,start  " backsapce now breaks lines
" }}}
" Spaces & Tabs {{{
    set tabstop=4           " 4 space tab
    set expandtab           " use spaces for tabs
    set softtabstop=4       " 4 space tab
    set shiftwidth=4        "  
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
"Window Management {{{
    set wmh=0
" }}}
" Testing Redeker
""""" Undo behaviour
set undolevels=10000    " raise possible undo-levels
set undofile            " keep persistent undos

set nowrap              " don't wrap my long lines
set scrolloff=5         " up/down scroll offsets
set sidescroll=10       " enable sidescroll
set sidescrolloff=15    " scroll offset when scolling sidewards
" invisible tabs, but visible trailing whitespace
set listchars=precedes:<,extends:>,trail:·,tab:\ \ 
set list                " enable visible spaces
set display=uhex        " prettier display of binary bytes
set laststatus=2        " always show statusline!
" rulerformat=+<offset>=<char hex>|<char dec>     <line>:<column> <% file>
set rulerformat=%-55(+%6o\|+%5O=0x%02B\|%04b\ <%{&ft}\ %4{&ff}\ %{&bin}\ %5{&fenc}>%=%02c%V\ %3p%%%)
set ruler
set vb t_vb=            " no bell
set hlsearch            " highlight search words
set noincsearch         " no incremental search for me
set numberwidth=6       " wider number column
set number              " display line numbers by default
set relativenumber      " display line numbers relatively
set cursorline          " highlight the current line of the cursor
set cursorcolumn        " highlight the current cursor column
set cmdheight=2         " to avoid hit-ENTER-prompts
set textwidth=0         " text EOL inserting off
set colorcolumn=80      " marker column at column 80
set fillchars+=vert:║   " draw a more distinct vertical window split
set wildmenu            " enable wildmenu, for completion

""""" Code/Text Editing
set pastetoggle=<F11>

" Multi-Line movement Up/Down in Visual Mode
vnoremap <C-j>                  dp'[V']
vnoremap <C-k>                  dkP'[V']
" Inserting newlines before/after without entering insertmode
nnoremap <S-Enter>              :normal! o<CR>
nnoremap <C-Enter>              I<CR><ESC>
" Remove trailing whitespace:
nnoremap <leader>rw             :s/\s\+$//<CR>
vnoremap <leader>rw             :s/\s\+$//<CR>
" Handle ( XYZ ) => (XYZ)
nnoremap <leader>ri             :s/( \(.*\) )/(\1)/<CR>
" Search for SQL keywords
nnoremap <leader>rq             /\c\<\(ALTER\\|TABLE\\|ADD\\|NUMBER\\|VARCHAR\\|VARCHAR2\\|SELECT\\|FROM\\|JOIN\\|AND\\|OR\\|WHERE\\|IN\\|ORDER\\|BY\\|GROUP\\|UPDATE\\|SET\\|AS\\|DISTINCT\\|COUNT\\|NVL\\|TO_DATE\\|SYSDATE\\|INSERT\\|INTO\\|VALUES\\|TO_CHAR\\|MAX\\|UPPER\\|LOWER\\|SUM\\|ROUND\\|DECODE\\|DELETE\)\><CR>
" Search for CaMeLCase
nnoremap <leader>rc             /\<[a-z][a-z0-9]*[A-Z][a-z][A-Za-z0-9]*\><CR>
nnoremap <leader>rC             /\<[A-Z][a-z0-9]*[A-Z][a-z][A-Za-z0-9]*\><CR>
nnoremap <leader>rx             :s/\(\l\)\(\u\)/\1\_\l\2/gc<CR>
" Jumping through quickfix list
nnoremap <C-b>                  :cprevious<CR>zz
nnoremap <C-n>                  :cnext<CR>zz
" Shortcut for managing marks
nnoremap <F6>                   'a
nnoremap <C-F6>                 ma

" Column search preset TODO
nnoremap <leader>8              /\c\%><C-R>=virtcol(".")<CR>v
" Ignorecase search
nnoremap <leader>7              /\c
" Clear search highlight
nnoremap <leader>6              :nohlsearch<CR>
" Jump to next match and replace
nnoremap <leader>n              n"yciw
" Toggle Line-Numbers
nnoremap <F9>                   :set number relativenumber!<CR>
" Toggle Scrollbind for current window
nnoremap <F4>                   :set scrollbind!<CR>:set scrollbind?<CR>
" Toggle List-Characters
nnoremap <F7>                   :set list!<CR>:set list?<CR>
" Shortcut for make
nnoremap <F5>                   :<C-U>make<CR>:copen<CR>G
" Diffing
nnoremap <F3>                   :difft<CR>
nnoremap <C-F3>                 :diffo!<CR>
" Toggle menubar
nnoremap <leader>me             :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

" New buffer from all/selected lines:
nnoremap <leader>bn             :%y<CR>:new<CR>ggP
vnoremap <leader>bn             :y<CR>:new<CR>ggP
" More simple pasting:
nnoremap <leader>ay             mbgg"+yGg`b
nnoremap <leader>p              "+p
nnoremap <leader>P              "*p
vnoremap <leader>y              "+y
vnoremap <leader>Y              "*y
" Move between window splits easier:
nnoremap <C-h>                  <C-w>h
nnoremap <C-j>                  <C-w>j
nnoremap <C-k>                  <C-w>k
nnoremap <C-l>                  <C-w>l
" Scroll horizontally:
nnoremap <M-h>                  10zh
nnoremap <M-l>                  10zl
inoremap <M-h>                  <Esc>10zhi
inoremap <M-l>                  <Esc>10zla
" Toggle Wrapping:
nnoremap <leader>ww             :setlocal wrap!<CR>
" Maximize/Equalize windows
nnoremap <C-_>                  <C-w>_
" Tab Management
nnoremap <C-Insert>             :tabnew<CR>
nnoremap <C-Del>                :tabclose<CR>
" Toggle cursorcolumn
nnoremap <leader>cc             :set cursorcolumn!<CR>
" Spell Checking
nnoremap <F8>                   :set spell!<CR>:set spell?<CR>
nnoremap <C-F8>                 :set spell!<CR>:set spelllang=de<CR>:set spell?<CR>
nnoremap <C-S-F8>               :set spell!<CR>:set spelllang=en<CR>:set spell?<CR>

" Insert optical splitter for functions
nnoremap <leader>tt				:set paste<CR>^i//<ESC>75a-<ESC>a<CR><ESC>:set nopaste<CR>
nnoremap <leader>tl				:set paste<CR>^i--<ESC>75a-<ESC>a<CR><ESC>:set nopaste<CR>

" Sorrounding operations:
" -[ABC]    - sorround any parens with '(', '[', '{'
"              placing a space after the opening paren and enter insert mode
"              (useful for lisp/clojure/scheme)
" -a[ABC]   - sorround any parens with '(', '[', '{'
" In visual mode:
" -[ABC]    - sorround visual selection with '(', '[', '{'
" -['"]     - sorround visual selection with "'", '"'
nnoremap <leader>A              mb%a)<ESC>`bi(
nnoremap <leader>B              mb%a]<ESC>`bi[
nnoremap <leader>C              mb%a}<ESC>`bi{
nnoremap <leader>aA             mb%a)<ESC>`bi(<SPACE><LEFT>
nnoremap <leader>aB             mb%a]<ESC>`bi[<SPACE><LEFT>
nnoremap <leader>aC             mb%a}<ESC>`bi{<SPACE><LEFT>
nnoremap <leader>aD             mb%a><ESC>`bi<<LEFT>
nnoremap <leader>aa             a()<LEFT>
nnoremap <leader>ab             a[]<LEFT>
nnoremap <leader>ac             a{}<LEFT>
nnoremap <leader>ad             a<><LEFT>
nnoremap <leader>ae             mb%x`bx
nnoremap <leader>a"             a""<LEFT>
nnoremap <leader>a'             a''<LEFT>
nnoremap <leader>a,             a``<LEFT>

nnoremap <leader>wa             viw<ESC>`<i(<ESC>`><RIGHT>a)<ESC>`<
nnoremap <leader>wb             viw<ESC>`<i[<ESC>`><RIGHT>a]<ESC>`<
nnoremap <leader>wc             viw<ESC>`<i{<ESC>`><RIGHT>a}<ESC>`<
nnoremap <leader>wd             viw<ESC>`<i<<ESC>`><RIGHT>a><ESC>`<
nnoremap <leader>w"             viw<ESC>`<i"<ESC>`><RIGHT>a"<ESC>`<
nnoremap <leader>w'             viw<ESC>`<i'<ESC>`><RIGHT>a'<ESC>`<
nnoremap <leader>w,             viw<ESC>`<i`<ESC>`><RIGHT>a`<ESC>`<

nnoremap <leader>Wa             viW<ESC>`<i(<ESC>`><RIGHT>a)<ESC>`<
nnoremap <leader>Wb             viW<ESC>`<i[<ESC>`><RIGHT>a]<ESC>`<
nnoremap <leader>Wc             viW<ESC>`<i{<ESC>`><RIGHT>a}<ESC>`<
nnoremap <leader>Wd             viW<ESC>`<i<<ESC>`><RIGHT>a><ESC>`<
nnoremap <leader>W"             viW<ESC>`<i"<ESC>`><RIGHT>a"<ESC>`<
nnoremap <leader>W'             viW<ESC>`<i'<ESC>`><RIGHT>a'<ESC>`<
nnoremap <leader>W,             viW<ESC>`<i`<ESC>`><RIGHT>a`<ESC>`<

vnoremap <leader>a              <ESC>`<i(<ESC>`><RIGHT>a)<ESC>`<
vnoremap <leader>b              <ESC>`<i[<ESC>`><RIGHT>a]<ESC>`<
vnoremap <leader>c              <ESC>`<i{<ESC>`><RIGHT>a}<ESC>`<
vnoremap <leader>d              <ESC>`<i<<ESC>`><RIGHT>a><ESC>`<
vnoremap <leader>"              <ESC>`<i"<ESC>`><RIGHT>a"<ESC>`<
vnoremap <leader>'              <ESC>`<i'<ESC>`><RIGHT>a'<ESC>`<
vnoremap <leader>,              <ESC>`<i`<ESC>`><RIGHT>a`<ESC>`<

" Refactoring helpers
nnoremap <leader>==             ".pa<SPACE>=<SPACE><ESC>""p==^
nnoremap <leader>=l             :let @r=@.<CR>i(<ESC>"rpa<SPACE>(<ESC>""pa))<ESC>==^
nnoremap <leader>=L             :let @r=@.<CR>i(let ((<ESC>"rpa<SPACE>(<ESC>""pa))))<ESC>==^

" HTML helpers
"" Erstellt aus aktueller Zeile einen beendeten zweizeiliges element:
nnoremap <leader>mm             <ESC>:s/<\?\([^>]*\)>\?/\1<CR>:nohlsearch<CR>^"xyiwi<<ESC>A><CR></<C-R>x><ESC>k$
vnoremap <leader>mm             <ESC>`<"xyiwi<<ESC>`>la><CR></<C-R>x><ESC>k$
"" Erstellt aus aktueller Zeile einen beendeten einzeiliges element:
"nnoremap <leader>mn             <ESC>^"xyiWi<<ESC>A></<C-R>x><ESC>F>
"" Erstellt aus aktueller Zeile einen den nächsten Tag umgebendes element:
nnoremap <leader>mk             <ESC>^"xyiwi<<ESC>A><ESC>jvat<ESC>o</<C-R>x><ESC>k>at
vnoremap <leader>mk             <ESC>`<"xyiwi<<ESC>`>la><ESC>f<vat<ESC>a</<C-R>x><ESC>

nnoremap <leader>mc             o<!-- --><ESC>bbE
vnoremap <leader>mq             <ESC>`<O<!--<ESC>`>o--><ESC>`<
nnoremap <leader>mq             vat<ESC>`<O<!--<ESC>`>o--><ESC>`<

" Column Align/Editing Helpers
let g:ED_LAST_MAX_COL=0
fu! AlignPatternColumns(bAlign4Indent) range

    if a:firstline == a:lastline
        let max_col = g:ED_LAST_MAX_COL

    else
        let max_col = -1
        for lnr in range(a:firstline, a:lastline)
            let cur_match = match(getline(lnr), @/)
            if cur_match >= 0
                if max_col < cur_match
                    let max_col = cur_match
                endif
            endif
        endfo
        let g:ED_LAST_MAX_COL = max_col
    endif

    if a:bAlign4Indent == 1
        let max_col += max_col % &shiftwidth
    endif


    for lnr in range(a:firstline, a:lastline)
        let cline = getline(lnr)
        let cur_match = match(getline(lnr), @/)

        if cur_match >= 0
            let first = strpart(cline, 0, cur_match)
            let rest = strpart(cline, cur_match)

            if max_col > cur_match
                for cntr in range(cur_match, max_col - 1)
                    let first = first . " "
                endfo

                call setline(lnr, first . rest)
            endif
        endif
    endfo
endfu

fu! AlignPatternIndentCols(iIndent) range
    call cursor(a:firstline, 1)

    let [lnum, cnum] = searchpos(@/, '', a:lastline)
    while lnum != 0 && cnum != 0

        let c0num = cnum - 1
        if (c0num % a:iIndent) != 0
            let cline = getline(lnum)
            let first = strpart(cline, 0, c0num)
            let rest  = strpart(cline, c0num)
            let padcnt = 0
            for id in range(1, (a:iIndent - (c0num % a:iIndent)))
                let first = first . ' '
                let padcnt += 1
            endfor
            call setline(lnum, first . rest)
            call cursor(lnum, cnum + padcnt)
        else
            call cursor(lnum, cnum)
        endif

        let [lnum, cnum] = searchpos(@/, '', a:lastline)
    endwhile
endfu

fu! CaseSwitchSearch(bUpper) range
    for lnr in range(a:firstline, a:lastline)
        let cline = getline(lnr)
        if a:bUpper == 1
            let cline = substitute(cline, '\(' . @/ . '\)', '\=toupper(submatch(1))', 'g')
        else
            let cline = substitute(cline, '\(' . @/ . '\)', '\=tolower(submatch(1))', 'g')
        endif
        call setline(lnr, cline)
    endfo
endfu

vnoremap <leader>sa             :call AlignPatternColumns(0)<CR>
nnoremap <leader>sa             :call AlignPatternColumns(0)<CR>
vnoremap <leader>si             :call AlignPatternColumns(1)<CR>
nnoremap <leader>si             :call AlignPatternColumns(1)<CR>
vnoremap <leader>st             :call AlignPatternIndentCols(&shiftwidth)<CR>
nnoremap <leader>st             :call AlignPatternIndentCols(&shiftwidth)<CR>

vnoremap <leader>su             :call CaseSwitchSearch(1)<CR>
nnoremap <leader>su             :call CaseSwitchSearch(1)<CR>
vnoremap <leader>sl             :call CaseSwitchSearch(0)<CR>
nnoremap <leader>sl             :call CaseSwitchSearch(0)<CR>

"""" File Operations

" Re-Indent complete file
nnoremap <leader>i              gg=G

"}}}
