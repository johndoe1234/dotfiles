set nocompatible               " be iMproved
filetype off                   " required!


"os detection to enable correct mappings and plugins
let isOsLinux = has("unix")
let runningOnLinux=1
let isOsWindows = has("win32")
let runningOnWindows=1


let mapleader = ","

if isOsWindows == runningOnWindows
    let g:dotFilesLocation = 'c:\dotfiles\'
    execute "so " . dotFilesLocation . "vimrc_windows"
    set rtp+=$VIM/bundle/vundle/
endif

if isOsLinux == runningOnLinux
    set rtp+=~/.vim/bundle/vundle/
    source ~/.vim/vimrc_linux
endif

"remap leader from \ to ,
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

"common plugins
Bundle 'tpope/vim-unimpaired'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'molokai'
Bundle 'LustyJuggler'
Bundle 'FSwitch'
Bundle 'The-NERD-Commenter'
Bundle 'surround.vim'
Bundle 'The-NERD-tree'
Bundle 'ScrollColors'
Bundle 'flazz/vim-colorschemes'
"conflicting with YCM, but usefull for neosnippet
"Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/neosnippet.vim'
Bundle 'honza/vim-snippets'
Bundle 'bling/vim-airline'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'kien/ctrlp.vim'
Bundle 'Valloric/YouCompleteMe'

if isOsLinux == runningOnLinux
    "Bundle 'tpope/vim-fugitive'
    "Bundle 'tpope/vim-rails.git'
    "Bundle 'SirVer/ultisnips'
    "Bundle 'ervandew/supertab'
    Bundle 'scrooloose/syntastic'
    colorscheme CodeFactoryv3
endif

if isOsWindows == runningOnWindows
    Bundle 'cscope.vim'
    "Bundle 'OmniCppComplete'
endif

if has("syntax")
    syntax on
endif

filetype plugin indent on     " required!


"when changing focus always write changes to a file
au FocusLost * :wa

"settings
set clipboard+=unnamed
set autowrite       " Automatically save before commands like :next and :make
set autoread
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set nobackup
set noswapfile
set encoding=utf-8
set autoindent
set showmode
set hidden             " Hide buffers when they are abandoned
set wildmenu
set wildmode=list:longest,full
set visualbell
"set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
set directory=~/.tmp
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.xml,*.obj,*.log,*.rsp
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set gdefault        " automatic adding g in regexp substisute :%s/something/else/g
set showcmd     " Show (partial) command in status line.
set hlsearch 
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
set list
set listchars=tab:▸\ ,eol:¬,trail:.,extends:#,nbsp:.
set scrolloff=8
set sidescrolloff=8
set history=500
" configure tags - add additional tags here or comment out not-used ones
set foldmethod=syntax
set guifont=Lucida_Console:h8:cANSI
set guioptions-=m
set guioptions-=l
set guioptions-=r
set guioptions-=T
set conceallevel=2
set concealcursor=vin
" Complete options (disable preview scratch window, longest removed to aways
" " show menu)
set completeopt=menu,menuone
" Limit popup menu height
set pumheight=20

if &diff
    " diff mode
    set diffopt+=iwhite
endif

highlight StatusLine ctermfg=blue ctermbg=yellow





"MAPPINGS
command! W w
"clearing search results
nnoremap <leader>/ :noh<cr>
"Disable Ex mode
map Q <Nop>
"Disable K looking stuff up
map K <Nop>
"killing arrow keiys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

"no need for F1 help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"no need to use shift
nnoremap ; :

"exiting insert mode with jj
inoremap jj <ESC>l
inoremap kk <ESC>l


inoremap "" ""<ESC>i
inoremap (( ()<ESC>i
inoremap [[ []<ESC>i
inoremap {{ {<CR>}<ESC>ko


"create new vertical split window and move to it
nnoremap <leader>w <C-w>v<C-w>l

"copying to windows copy/paste buffer
nnoremap <leader>yw "*yaw
nnoremap <leader>yy "*yyy

"moving between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
map <C-x> <C-w>c


nnoremap <silent> <leader>nt :NERDTreeToggle<CR>

" Space to toggle folds.
nnoremap <Space> zA
vnoremap <Space> zA
"

nnoremap <leader>fo :call FormatCpp()<CR><CR>
nnoremap <leader>zf :CtrlPMixed<CR>
nnoremap <leader>zl :CtrlPLine<CR>
nnoremap <leader>zb :CtrlPBuffer<CR>
nnoremap <leader>zt :CtrlPTag<CR>

nnoremap <silent> <leader>nt :NERDTreeToggle<CR>

"fugitive mappings
nnoremap <silent> <leader>gs :Gstatus<CR> "getting status

"FSwitch definitions and mappings
augroup mycppfiles
    au!
    "creating .cpp files if it does not exist,
    "and looking for .cc and .c fle if .cpp does not exist
    au BufEnter *.h let b:fswitchdst  = 'cpp,cc,C'
augroup END

"Switch to the file and load it into the current window 
nmap <silent> <Leader>of :FSHere<cr>
"Switch to the file and load it into the window on the right 
nmap <silent> <Leader>ol :FSRight<cr>
"Switch to the file and load it into a new window split on the right 
nmap <silent> <Leader>oL :FSSplitRight<cr>
"Switch to the file and load it into the window on the left 
nmap <silent> <Leader>oh :FSLeft<cr>
"Switch to the file and load it into a new window split on the left 
nmap <silent> <Leader>oH :FSSplitLeft<cr>

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

let g:LustyJugglerSuppressRubyWarning = 1

imap <S-CR> <CR><CR>}<Esc>-cc

"if !exists('g:neocomplete#force_omni_input_patterns')
    "let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_overwrite_completefunc = 1
"let g:neocomplete#force_omni_input_patterns.c =
            "\ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
"let g:neocomplete#force_omni_input_patterns.cpp =
            "\ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
"let g:neocomplete#force_omni_input_patterns.objc =
            "\ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
"let g:neocomplete#force_omni_input_patterns.objcpp =
            "\ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_at_startup = 1

imap <C-k> <Plug>(neosnippet_expand_or_jump)

"CtrlP settings
let g:ctrlp_working_path_mode = 'o'
let g:ctrlp_by_filename=1
let g:ctrlp_match_window = 'top,order:btt,min:1,max:10'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
function! FormatCpp()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    "removing white space on the end of the lines
    silent! %s/\([(){};]\)\s\+$/\1/
    silent! %s/\(\S\)\s\+$/\1/

    "removing whitespace  smth     , -> smth,
    "(  smth -> (smth
    "smth   ) -> smt)
    silent! %s/\s\+\([),]\)/\1/
    silent! %s/\([(]\)\s\+/\1/

    "removing whitespace  ,smth -> , smth
    silent! %s/,\(\w\)/, \1/

    "convert something==something -> something == something
    silent! %s/\(\S\)\([=!>+<]\{1\}=\)/\1 \2/
    silent! %s/\([=!>+<]\{1\}=\)\(\S\)/\1 \2/
    silent! %s/\(\S\)\(<<\)/\1 \2/
    silent! %s/\(<<\)\(\S\)/\1 \2/

    "removing whitspace from ==
    silent! %s/\s\{2,}\([=!>+<]=\)/ \1/
    silent! %s/\([=!>+<]=\)\s\{2,}/\1 /

    "converting  smth     = -> smth =
    silent! %s/\s\{2,\}\([=,<>/]\)/ \1/
    silent! %s/\([=,<>/]\)\s\{2,\}/\1 /


    "chainging if ( to if(
    silent! %s/\([a-z]\)\s\+(/\1(/
    silent! %s/\([a-z]\)\s\+)/\1)/

    "formatting
    silent! normal ggVG=

    silent! :w
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

let g:diffed_buffers=[]
function! DiffText(a, b, diffed_buffers)
    enew
    setlocal buftype=nowrite
    call add(a:diffed_buffers, bufnr('%'))
    call setline(1, split(a:a, "\n"))
    diffthis
    vnew
    setlocal buftype=nowrite
    call add(a:diffed_buffers, bufnr('%'))
    call setline(1, split(a:b, "\n"))
    diffthis
endfunction
 
function! WipeOutDiffs(diffed_buffers)
    for buffer in a:diffed_buffers
        execute 'bwipeout! '.buffer
    endfor
endfunction

nnoremap <special> <leader>dd :call DiffText(@a, @b, g:diffed_buffers)<CR>
nnoremap <special> <leader>dw :call WipeOutDiffs(g:diffed_buffers) | let g:diffed_buffers=[]
