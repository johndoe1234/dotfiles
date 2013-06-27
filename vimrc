set nocompatible               " be iMproved
filetype off                   " required!


"os detection to enable correct mappings and plugins
let isOsLinux = has("unix")
let runningOnLinux=1
let isOsWindows = has("win32")
let runningOnWindows=1

if has("syntax")
    syntax on
endif

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
Bundle 'FuzzyFinder'
Bundle 'L9'
Bundle 'molokai'
Bundle 'LustyJuggler'
Bundle 'FSwitch'
Bundle 'ProtoDef'
Bundle 'commentary.vim'
Bundle 'The-NERD-Commenter'
Bundle 'surround.vim'
Bundle 'The-NERD-tree'
Bundle 'ScrollColors'
Bundle 'flazz/vim-colorschemes'
Bundle 'clang-complete'

if isOsLinux == runningOnLinux
    Bundle 'tpope/vim-fugitive'
    Bundle 'tpope/vim-rails.git'
    Bundle 'ctrlp.vim'
    Bundle 'SirVer/ultisnips'
    Bundle 'ervandew/supertab'
endif

if isOsWindows == runningOnWindows
    Bundle 'cscope.vim'
    Bundle 'OmniCppComplete'
endif

filetype plugin indent on     " required!

"when changing focus always write changes to a file
au FocusLost * :wa

"settings
set autowrite		" Automatically save before commands like :next and :make
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
set cursorline
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
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set gdefault        " automatic adding g in regexp substisute :%s/something/else/g
set showcmd		" Show (partial) command in status line.
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
nnoremap <leader>zf :FufCoverageFile<CR>
nnoremap <leader>zl :FufLine<CR>
nnoremap <leader>zb :FufBuffer<CR>
nnoremap <leader>zt :FufTag<CR>

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

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby imap <S-CR> <CR><CR>end<Esc>-cc
autocmd FileType cpp imap <S-CR> <CR><CR>}<Esc>-cc

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
