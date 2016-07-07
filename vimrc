set nocompatible               " be iMproved
filetype off                   " required!


"os detection to enable correct mappings and plugins
let isOsLinux = has("unix")
let runningOnLinux=1
let isOsWindows = has("win32")
let runningOnWindows = 1
let isGUIOn = has("gui_running")

let mapleader = ","

if isGUIOn
    " GUI is running or is about to start.
    " Maximize gvim window.
    set lines=999 columns=999
endif

if isOsWindows == runningOnWindows
    let g:dotFilesLocation = 'c:\dotfiles\'
    execute "so " . dotFilesLocation . "vimrc_windows"
    set rtp+=$VIM/bundle/vundle/
endif

if isOsLinux == runningOnLinux
    set rtp+=~/.vim/bundle/vundle/
    source ~/dotfiles/vimrc_linux
endif


call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'molokai'

if 0 == isGUIOn
    Bundle 'tpope/vim-unimpaired'
    Bundle 'LustyJuggler'
    Bundle 'FSwitch'
    Bundle 'The-NERD-Commenter'
    Bundle 'surround.vim'
    Bundle 'The-NERD-tree'
    Bundle 'ScrollColors'
    Bundle 'flazz/vim-colorschemes'

    Bundle 'honza/vim-snippets'
    Bundle 'bling/vim-airline'
    Bundle 'kien/ctrlp.vim'
    Bundle 'Valloric/YouCompleteMe'
    Bundle 'Yggdroot/indentLine'
    Bundle 'funorpain/vim-cpplint'
    Bundle 'rking/ag.vim'
    Bundle 'marijnh/tern_for_vim'

    Bundle 'scrooloose/syntastic'
    Bundle 'jaxbot/browserlink.vim'
    Bundle 'pangloss/vim-javascript'
    Bundle 'mhinz/vim-signify'

    Bundle 'jeaye/color_coded'
    Bundle 'rdnetto/YCM-Generator'

endif

    ""Bundle 'Lokaltog/vim-easymotion'
    ""Bundle 'Tabular'
    ""conflicting with YCM, but usefull for neosnippet
    ""Bundle 'Shougo/neocomplete.vim'
    ""Bundle 'Shougo/neosnippet.vim'
    ""Bundle 'terryma/vim-multiple-cursors'
    ""Bundle 'vim-scripts/DfrankUtil'
    ""Bundle 'vim-scripts/vimprj'
    ""Bundle 'phreaknerd/vim-indexer'
    ""JavaScript plugins
    ""Bundle 'wookiehangover/jshint.vim'
    ""Bundle 'Shutnik/jshint2.vim'
    "Bundle 'vim-scripts/highlight.vim'
    ""colorscheme CodeFactoryv3
""JavaScirpt variables
""let jshint2_read = 1
""let jshint2_save = 1
""let jshint2_close = 0
let g:tern_show_argument_hints="on_hold"
let g:tern_show_signature_in_pum=1
"let g:tern_map_keys=1

"Documentation under cursor
nmap <Leader>td :TernDoc <CR>
"Browse documentation
nmap <Leader>tb :TernDocBrowse <CR>
"Type hints
nmap <Leader>tt :TernType <CR>
"Jump to definition (yes, 'td' is duplicated)
nmap <Leader>td :TernDef <CR>
"Jump to definition inside preview
nmap <Leader>tpd :TernDefPreview <CR>
"Definition in new split
nmap <Leader>tsd :TernDefSplit <CR>
"Definition in new tab
nmap <Leader>ttd :TernDefTab <CR>
"All references under cursor
nmap <Leader>tr :TernRefs <CR>
"Rename variable
nmap <Leader>tR :TernRename <CR>


if isOsLinux == runningOnLinux
    Bundle 'SirVer/ultisnips'
    Bundle 'tpope/vim-dispatch'
    Bundle 'tpope/vim-fugitive'
    Bundle 'jrosiek/vim-mark'
    "colorscheme molokai
    colorscheme mrkn256
    set rtp+=~/.fzf
endif

"source /home/koziowsk/dotfiles/im_scripts/log_grepping.vim

filetype plugin indent on     " required!


if 0 == isGUIOn
   "when changing focus always write changes to a file
   au FocusLost * :wa
endif

"settings
set ic
set is
set undodir=~/.vimundo/
set clipboard+=unnamedplus
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
set lazyredraw
set nocursorcolumn
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set number
set undofile
set directory=~/.tmp
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*\\Users\\kozlopio\\Appdata\\*
set wildignore+=*.xml,*.obj,*.log,*.rsp
"set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set gdefault        " automatic adding g in regexp substisute :%s/something/else/g
set showcmd     " Show (partial) command in status line.
set hlsearch
set wrap
set textwidth=79
set formatoptions=qrn1
"set colorcolumn=85
set list
set listchars=tab:▸\ ,eol:¬,trail:.,extends:#,nbsp:.
set scrolloff=8
set sidescrolloff=8
set history=500
"configure tags - add additional tags here or comment out not-used ones
set foldlevel=99
set foldmethod=indent
set synmaxcol=120
set cursorline
set guifont=Lucida_Console:h8:cANSI
set guioptions-=m
set guioptions-=l
if 0 == isGUIOn
set guioptions-=r
endif
set guioptions+=p
set guioptions-=T
set conceallevel=2
set concealcursor=vin
" Complete options (disable preview scratch window, longest removed to aways
" show menu)
set completeopt=menu,menuone
"" Limit popup menu height
set pumheight=20
set mouse=a
syntax on

if &diff
   " diff mode
   set diffopt+=iwhite
endif

highlight StatusLine ctermfg=blue ctermbg=yellow

"MAPPINGS
command! W w
command! Wq wq
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

"searching with ag
nnoremap <leader>a :Ag <C-r><C-w><CR>
nnoremap <leader>A :Ag <C-r>+<CR>
"nnoremap <leader>/ /<C-r>+<CR>
nnoremap <leader>f /<C-r><C-w><CR>

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
command! J :%!python -mjson.tool

if 0 == isGUIOn
   nnoremap <leader>fo :call FormatCpp()<CR><CR>
   nnoremap <leader>zf :CtrlPMixed<CR>
   nnoremap <leader>zl :CtrlPLine<CR>
   nnoremap <leader>zb :CtrlPBuffer<CR>
   nnoremap <leader>zt :CtrlPTag<CR>
   nnoremap <silent> <leader>nt :NERDTreeToggle<CR>

   "FSwitch definitions and mappings
   augroup mycppfiles
   au!
   "creating .cpp files if it does not exist,
   "and looking for .cc and .c fle if .cpp does not exist
   au BufEnter *.h let b:fswitchlocs  = 'reg:/include/static'
   au BufEnter *.hpp let b:fswitchlocs  = 'reg:/include/static'
   au BufEnter *.cpp let b:fswitchlocs  = 'reg:/static/include'
   au BufEnter *.hpp let b:fswitchdst  = 'cpp,cc,C'
   au BufEnter *.h let b:fswitchdst  = 'cpp,cc,C'
   au BufEnter *.cpp let b:fswitchdst  = 'h,hpp'
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

   "CtrlP settings
   let g:ctrlp_working_path_mode = 'o'
   let g:ctrlp_by_filename=1
   let g:ctrlp_match_window = 'top,order:btt,min:1,max:20'
   let g:ctrlp_map = '<c-p>'
   let g:ctrlp_cmd = 'CtrlP'
   "let g:ctrlp_cmd = 'CtrlPMixed'
   let g:ctrlp_user_command = 'ag %s --ignore=*.cpp.o -l --nocolor -g ""'
   let g:ctrlp_use_caching=0
   let g:ctrlp_clear_cache_on_exit = 1
   let g:ctrlp_custom_ignore = {
      \ 'file': '\v\.(o|so|dll)$',
      \ }
   let g:ctrlp_max_files = 0
   let g:ctrlp_lazy_update = 100

   let g:ycm_confirm_extra_conf = 0
   let g:ycm_use_ultisnips_completer = 1

   let g:UltiSnipsExpandTrigger="<c-e>"
   let g:UltiSnipsJumpForwardTrigger="<c-b>"
   let g:UltiSnipsJumpBackwardTrigger="<c-z>"

   " If you want :UltiSnipsEdit to split your window.
   let g:UltiSnipsEditSplit="vertical"

   let g:LustyJugglerSuppressRubyWarning = 1
   let g:ag_prg="ag --vimgrep --smart-case --ignore=*.json --ignore=*.o--ignore-dir=testutils --ignore-dir=test"
   let g:ag_highlight=1


endif


let g:ycm_add_preview_to_completeopt = 1

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif



"highlight trailing white space at the end of the line
match Todo /\s\+$/

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
