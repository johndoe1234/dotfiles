set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

let os = substitute(system('uname'), "\n", "", "")

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
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
if os == "Linux"
    Bundle 'tpope/vim-fugitive'
    Bundle 'clang-complete'
    Bundle 'tpope/vim-rails.git'
    Bundle 'ctrlp.vim'
endif
" non github repos
Bundle 'git://git.wincent.com/command-t.git'

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
set undodir=~/.tmp
set directory=~/.tmp
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
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
set tags+=c:\tags\cpp
set tags+=OAMtags
set foldmethod=syntax
set guifont=Lucida_Console:14h
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



"if &t_Co >= 256 || has("gui_running")
"colorscheme molokai
"colorscheme darkblue
colorscheme zellner
"endif


if has("syntax")
    syntax on
endif

if has("autocmd")
    if os == "Linux"
        autocmd! bufwritepost vimrc source ~/.vim/vimrc
        autocmd! bufwritepost .vimrc source ~/.vim/vimrc
        autocmd BufRead *.cpp :call FormatCpp()
        autocmd BufRead *.h :call FormatCpp()
    endif
endif

"remap leader from \ to ,
let mapleader = ","


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

nnoremap <silent> <leader>ev :e ~/.vim/vimrc<CR>
nnoremap <silent> <leader>sv :so ~/.vim/vimrc<CR>

nnoremap <silent> <leader>nt :NERDTreeToggle<CR>

" Space to toggle folds.
nnoremap <Space> zA
vnoremap <Space> zA
"

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

"setings for tagbar
let g:tagbar_left=1
nnoremap <silent> <F9> :TagbarToggle<CR>

" build tags of your own project with Ctrl-F12
map <C-F12> :silent !ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <C-F11> :silent !cscope -b -R<CR>
map <C-F10> :silent !ctags -R -L ctags_includes --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q -f OAMtags<CR>

nnoremap <Leader>f :call FormatCpp()<CR>

let g:LustyJugglerSuppressRubyWarning = 1

if os == "Linux"
    let g:clang_use_library=1
    let g:clang_library_path="/usr/lib/libclang.so.1"
    nnoremap <Leader>q :call g:ClangUpdateQuickFix()<CR>
    let g:clang_complete_auto = 0
    let g:clang_complete_copen = 1
    let g:clang_auto_select=1
    let g:clang_hl_errors=1
    let g:clang_periodic_quickfix=0
    let g:clang_snippets=1
    let g:clang_snippets_engine="clang_complete"
    let g:clang_conceal_snippets=1
    let g:clang_exec="clang"
    let g:clang_user_options=""
    let g:clang_auto_user_options="path, .clang_complete"
    let g:clang_sort_algo="priority"
    let g:clang_complete_macros=1
    let g:clang_complete_patterns=0
    nnoremap <Leader>q :call g:ClangUpdateQuickFix()<CR>
endif

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

    "removing whitspace from ==
    silent! %s/\s\{2,}\([=!>+<]=\)/ \1/
    silent! %s/\([=!>+<]=\)\s\{2,}/\1 /

    "converting  smth     = -> smth =
    silent! %s/\s\{2,\}\([=<>]\)/ \1/
    silent! %s/\([=<>]\)\s\{2,\}/\1 /

    "formatting
    silent! normal ggVG=

    silent! :w
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
