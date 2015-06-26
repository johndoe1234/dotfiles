nnoremap <silent> <leader>eg :e ~/dotfiles/gvimrc<CR>

set ic
set hls
set is

set ruler
set showcmd
set incsearch


set guifont=Monospace
let g:MyTag='kozlowski'
let g:TeamTag='S1'
let g:FileCounter=0
let $VIM_S1_SCRIPTS = '/home/koziowsk/dotfiles/vim_scripts'
let $VIM_S1_COLORS  = '/home/koziowsk/dotfiles/vim_scripts'

colorscheme molokai

set noswapfile

"zmienne do wyswietlania bufora wyszkukiwanych stringow w nowym oknie
let g:winBufName = 'bufor'
"let g:winBufName = 'multiSearchBuf'
let g:buforek = ""

set nobackup
set history=100
filetype plugin indent on
vnoremap <BS> d

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "*x
vnoremap <S-Del> "*x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "*y
vnoremap <C-Insert> "*y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+gP
map <S-Insert>		"+gP

cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+

noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

" CTRL-F4 is Close window
noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c

"zaznaczenie aktualnej linii
set cursorline
"hi CursorLine ctermbg = Red guibg = #F5FBF6
hi CursorLine ctermbg = Red guibg = gray15 guifg = gray80

nmap <F4> :q!<CR><CR>


highlight Normal 	guibg=black 		guifg=grey85
highlight Cursor guibg=Green guifg=NONE



au! BufRead,BufNewFile *.log set filetype=BTSLog
"au! Syntax BTSLog source $VIM_S1_COLORS/BLog.vim


"source $VIM_S1_SCRIPTS/bts_status.vim

"source $VIM_S1_SCRIPTS/my_search.vim

"source $VIM_S1_SCRIPTS/buf_display.vim
"source $VIM_S1_SCRIPTS/kolor.vim
"source $VIM_S1_SCRIPTS/my_delete.vim
"source $VIM_S1_SCRIPTS/multiCopy.vim
"source $VIM_S1_SCRIPTS/my_multiSearch.vim
"source $VIM_S1_SCRIPTS/my_notepad_search.vim
"source $VIM_S1_SCRIPTS/my_search_tag.vim
"source $VIM_S1_SCRIPTS/my_tagger.vim
"source $VIM_S1_SCRIPTS/my_tagger_important.vim
source $VIM_S1_SCRIPTS/log_grepping.vim



"nmap <C-LeftMouse> :call MyGoTo()<CR><CR> 






"kolorowanie
let g:tAllWords = ""
let g:tK1Words = ""
let g:tK2Words = ""
let g:tK3Words = ""
let g:tK4Words = ""
let g:tK5Words = ""
let g:tK6Words = ""
let g:tK7Words = ""
let g:tK8Words = ""

let w:AllWords = ""
let w:K1Words = ""
let w:K2Words = ""
let w:K3Words = ""
let w:K4Words = ""
let w:K5Words = ""
let w:K6Words = ""
let w:K7Words = ""
let w:K8Words = ""

