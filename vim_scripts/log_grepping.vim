let g:MyTag='kozlowski'
let g:TeamTag='S1'
let g:FileCounter=0
"zmienne do wyswietlania bufora wyszkukiwanych stringow w nowym oknie
let g:winBufName = 'bufor'
"let g:winBufName = 'multiSearchBuf'
let g:buforek = ""
nmap <F4> :q!<CR><CR>



function! BtsStatus()
    let @a=''
    execute 'g/' . escape('STUP, BTS Status is now \|sw version.*wn\d\|wdog feeding','[/]') . '/y A'
    tabnew
    put a
    "source $VIM_S1_COLORS/BTSLog.vim
    let @a=''
endfunction


function! TagAllMatches()
    "%s/^.*747\(.*| kozlowski\)\@!.*$/dupaq
    execute 'silent! %s/\(^.*' . escape(@*,'[\/]') .'\(.*| ' . g:MyTag . '\)\@!.*$\)/\1 | ' . g:MyTag
endfunction! 

function! RemoveTagFromAllMatches()
    execute '%s/' . escape(@*,'[\/]') . '.*\zs|\s' . g:MyTag . '//'	
endfunction

function! GoToLine(bang, line1, line2, count, qargs)
    exec "normal \<leftmouse>"
    let szukajka = getline(".")	
    let tabNumber =  (a:count - a:line1) + 1
    if a:count == -1
        execute 'tabn 1'
    else
        execute 'tabn ' . tabNumber
    endif
    execute '/' . escape(szukajka,'/[]')
endfunction


function! TagOneLine()
    "execute 'g/' .a escape(@*,'[\/]') . '.*/norm A| wazne'
    execute 'norm A| ' . g:TeamTag
endfunction

function! RemoveTagFromLine()
    "execute '%s/' . escape(@*,"/") . '.*\zs\<\|\swazne\>\ze.*//'
    execute '%s/' . escape(@*,'[\/]') . '.*\zs|\s' . g:TeamTag . '//'	
endfunction


function! MySearch()
    let @a=''
    "inicjowanie globali, zeby z poprzedniej karty listy slow przeniesc
    let g:tAllWords = w:AllWords
    let g:tK1Words = w:K1Words
    let g:tK2Words = w:K2Words
    let g:tK3Words = w:K3Words
    let g:tK4Words = w:K4Words
    let g:tK5Words = w:K5Words
    let g:tK6Words = w:K6Words
    let g:tK7Words = w:K7Words
    let g:tK8Words = w:K8Words

    "szukanie
    "echo escape(@*, '[\/]')
    execute 'g/' . escape(@*, '[\/]') . '/y A'
    tabnew
    put a
    "styl kolorowania
    "source $VIM_S1_COLORS/BTSLog.vim

    let w:filename='search_results' . g:FileCounter
    let g:FileCounter= g:FileCounter+1
    "execute 'file ' . w:filename
    execute 'write! ' . w:filename
    setlocal noswapfile


    "przypisanie globali do lokalnych zmiennych
    let w:AllWords = g:tAllWords
    let w:K1Words = g:tK1Words
    let w:K2Words = g:tK2Words
    let w:K3Words = g:tK3Words
    let w:K4Words = g:tK4Words
    let w:K5Words = g:tK5Words
    let w:K6Words = g:tK6Words
    let w:K7Words = g:tK7Words
    let w:K8Words = g:tK8Words

    "wyczyszczenie globali
    let g:tAllWords = ""
    let g:tK1Words = ""
    let g:tK2Words = ""
    let g:tK3Words = ""
    let g:tK4Words = ""
    let g:tK5Words = ""
    let g:tK6Words = ""
    let g:tK7Words = ""
    let g:tK8Words = ""
    call ReColor()
    let @a=''
endfunction



function! MySearch2()
    execute '!ag -m 100000000 --no-numbers --stats -i ''' . escape(@*, '()[\/]') . ''' % > search_out'
    tabnew
    r search_out
    execute 'silent! %s/\r//'

    let w:filename='search_results' . g:FileCounter
    let g:FileCounter= g:FileCounter+1
    "execute 'file ' . w:filename
    execute 'write! ' . w:filename
    "setlocal noswapfile
endfunction

function! MySearchTag()
    let @a=''
    execute 'g/|\s'. g:MyTag . '\||\s' . g:TeamTag. '/y A'
    tabnew
    put a
    "source $VIM_S1_COLORS/BTSLog.vim
    execute 'silent! %s/| '. g:MyTag . '//'
    execute 'silent! %s/| '. g:TeamTag . '//'
    let w:filename='search_results' . g:FileCounter
    let g:FileCounter= g:FileCounter+1
    "execute 'file ' . w:filename
    execute 'write! ' . w:filename
    setlocal noswapfile
    let @a=''
endfunction

function! MyNotepadSearch()
    let @a=''
    if !(exists('w:filename'))
        if !empty(@%)
            let w:filename=@%
        else
            let w:filename='search_results' . g:FileCounter
            let g:FileCounter= g:FileCounter+1
        endif
        "execute 'file ' . w:filename		
        execute 'write! ' . w:filename
    endif		
    execute 'lvim/' . escape(@*, '[/]') . '/ ' . w:filename
    lopen	
endfunction

function! MyNotepadMultiSearch()
    if !(exists('w:filename'))
        if !empty(@%)
            let w:filename=@%
        else
            let w:filename='search_results' . g:FileCounter
            let g:FileCounter= g:FileCounter+1
        endif
        "execute 'file ' . w:filename		
        execute 'write! ' . w:filename
    endif	
    execute 'lvim/' . escape(g:buforek, '[/]') . '/ ' . w:filename
    lopen	
    let @a=''
endfunction

function! MyMultiSearch()
    let @a=''
    "inicjowanie globali, zeby z poprzedniej karty listy slow przeniesc
    let g:tAllWords = w:AllWords
    let g:tK1Words = w:K1Words
    let g:tK2Words = w:K2Words
    let g:tK3Words = w:K3Words
    let g:tK4Words = w:K4Words
    let g:tK5Words = w:K5Words
    let g:tK6Words = w:K6Words
    let g:tK7Words = w:K7Words
    let g:tK8Words = w:K8Words

    execute 'g/' . escape(g:buforek, '[/]') . '/y A'
    tabnew
    put a
    "source $VIM_S1_COLORS/BTSLog.vim

    let w:filename='search_results' . g:FileCounter


    let g:FileCounter= g:FileCounter+1
    "execute 'file ' . w:filename
    execute 'write! ' . w:filename
    setlocal noswapfile


    "przypisanie globali do lokalnych zmiennych
    let w:AllWords = g:tAllWords
    let w:K1Words = g:tK1Words
    let w:K2Words = g:tK2Words
    let w:K3Words = g:tK3Words
    let w:K4Words = g:tK4Words
    let w:K5Words = g:tK5Words
    let w:K6Words = g:tK6Words
    let w:K7Words = g:tK7Words
    let w:K8Words = g:tK8Words

    "wyczyszczenie globali
    let g:tAllWords = ""
    let g:tK1Words = ""
    let g:tK2Words = ""
    let g:tK3Words = ""
    let g:tK4Words = ""
    let g:tK5Words = ""
    let g:tK6Words = ""
    let g:tK7Words = ""
    let g:tK8Words = ""

    call ReColor()
    let @a=''
endfunction

function! MyMultiSearch2()
    execute '!ag -m 100000000 --no-numbers --stats -i ''' . escape(g:buforek, '()[\/][\/]') . ''' % > search_out'
    tabnew
    r search_out

    let w:filename='search_results' . g:FileCounter
    let g:FileCounter= g:FileCounter+1
    "execute 'file ' . w:filename
    execute 'write! ' . w:filename
    setlocal noswapfile
endfunction

function! MyDelete()
	execute 'g/' . escape(@*, '[\/]') . '/d'
endfunction

function! MyMultiCopy()
    if !(g:buforek == "")
        let g:buforek = g:buforek.'\|'.@*
    else
        let g:buforek = @*
    endif

    "okno w ktorym tne bufor jest wyswietlany
    let winnum = bufwinnr(g:winBufName)
    "jak okno jest otwarte to odswiezamy
    if winnum != -1
        "przejdz do okna z buforem
        exe winnum . 'wincmd w'
        "czy na bank tam jestesmy?
        if winnr() == winnum
            norm G
            norm A
            "norm gg
            "norm 1000dd
            "let counter = 1
            "let costam = split(g:buforek,'\\|')
            "for value in costam
            "	call setline(counter, value)
            "let counter=counter+1
            "endfor
            put = @*
            "przejdz do okna po prawej = syslog
            exe 'wincmd l'
        endif
    endif
endfunction


function! AddWords(type, text)
    if !(w:AllWords == "")
        let w:AllWords = w:AllWords."\\|".a:text
    else
        let w:AllWords = a:text
    endif

    if(a:type == "K1")
        if !(w:K1Words == "")
            let w:K1Words = w:K1Words."\\|".a:text
        else
            let w:K1Words = a:text
        endif
    endif

    if(a:type == "K2")
        if !(w:K2Words == "")
            let w:K2Words = w:K2Words."\\|".a:text
        else
            let w:K2Words = a:text
        endif
    endif

    if(a:type == "K3")
        if !(w:K3Words == "")
            let w:K3Words = w:K3Words."\\|".a:text
        else
            let w:K3Words = a:text
        endif
    endif

    if(a:type == "K4")
        if !(w:K4Words == "")
            let w:K4Words = w:K4Words."\\|".a:text
        else
            let w:K4Words = a:text
        endif
    endif

    if(a:type == "K5")
        if !(w:K5Words == "")
            let w:K5Words = w:K5Words."\\|".a:text
        else
            let w:K5Words = a:text
        endif
    endif

    if(a:type == "K6")
        if !(w:K6Words == "")
            let w:K6Words = w:K6Words."\\|".a:text
        else
            let w:K6Words = a:text
        endif
    endif

    if(a:type == "K7")
        if !(w:K7Words == "")
            let w:K7Words = w:K7Words."\\|".a:text
        else
            let w:K7Words = a:text
        endif
    endif

    if(a:type == "K8")
        if !(w:K8Words == "")
            let w:K8Words = w:K8Words."\\|".a:text
        else
            let w:K8Words = a:text
        endif
    endif


endfunction

function! MyMultiColor(type)
    let text = @*
    call AddWords(a:type, text)
    let @/=w:AllWords
    call matchadd(a:type, text)
    let g:globalMatches = getmatches()
endfunction


function! CleanBuffers()
    let w:K1Words=""
    let w:K2Words=""
    let w:K3Words=""
    let w:K4Words=""
    let w:K5Words=""
    let w:K6Words=""
    let w:K7Words=""
    let w:K8Words=""
    let w:AllWords=""
    call clearmatches()
endfunction

function! FindPattern(pattern)
    let l:lista = getmatches()
    let l:itemID = "-1"
    for item in lista
        if(item.pattern == a:pattern)
            echo item.id
            let l:itemID = item.id
        endif
    endfor
    if !(l:itemID == "-1")
        call matchdelete(itemID)
    endif
endfunction

function! DeleteFromBuffers(pattern)
    let l:firstMatch = '^'.a:pattern.'\\|'
    let l:middleMatch = '\\|'.a:pattern.'\\|'
    let l:lastMatch = '\\|'.a:pattern.'$'
    let l:singleMatch = '^'.a:pattern.'$'
    "let l:text = 'ble\|bla\|blebla\|bleble\|blebla'
    "let l:text = 'F/LGC/FA\|F/LGC/FA\|F/LGC/FA\|F/LGC/FA\|F/LGC/FA'
    "echo l:text
    "let l:text = substitute(l:text, l:middleMatch,'\\|',"g")
    "let l:text = substitute(l:text, l:middleMatch,'\\|',"g")
    "let l:text = substitute(l:text, l:firstMatch,"","")
    "let l:text = substitute(l:text, l:lastMatch,"","")
    "let l:text = substitute(l:text, l:singleMatch,"","")
    "kasowanie z buforow ze slowami
    "1)2xsrodek globalnie, bo jeden raz to za malo
    "2)koniec
    "3)poczatek
    "4)jesli tylko jeden string w buforze to patern na pojedynczy string


    let w:K1Words = substitute(w:K1Words, l:middleMatch,'\\|',"g")
    let w:K1Words = substitute(w:K1Words, l:middleMatch,'\\|',"g")
    let w:K1Words = substitute(w:K1Words, l:firstMatch,"","")
    let w:K1Words = substitute(w:K1Words, l:lastMatch,"","")
    let w:K1Words = substitute(w:K1Words, l:singleMatch,"","")

    let w:K2Words = substitute(w:K2Words, l:middleMatch,'\\|',"g")
    let w:K2Words = substitute(w:K2Words, l:middleMatch,'\\|',"g")
    let w:K2Words = substitute(w:K2Words, l:firstMatch,"","")
    let w:K2Words = substitute(w:K2Words, l:lastMatch,"","")
    let w:K2Words = substitute(w:K2Words, l:singleMatch,"","")

    let w:K3Words = substitute(w:K3Words, l:middleMatch,'\\|',"g")
    let w:K3Words = substitute(w:K3Words, l:middleMatch,'\\|',"g")
    let w:K3Words = substitute(w:K3Words, l:firstMatch,"","")
    let w:K3Words = substitute(w:K3Words, l:lastMatch,"","")
    let w:K3Words = substitute(w:K3Words, l:singleMatch,"","")

    let w:K4Words = substitute(w:K4Words, l:middleMatch,'\\|',"g")
    let w:K4Words = substitute(w:K4Words, l:middleMatch,'\\|',"g")
    let w:K4Words = substitute(w:K4Words, l:firstMatch,"","")
    let w:K4Words = substitute(w:K4Words, l:lastMatch,"","")
    let w:K4Words = substitute(w:K4Words, l:singleMatch,"","")

    let w:K5Words = substitute(w:K5Words, l:middleMatch,'\\|',"g")
    let w:K5Words = substitute(w:K5Words, l:middleMatch,'\\|',"g")
    let w:K5Words = substitute(w:K5Words, l:firstMatch,"","")
    let w:K5Words = substitute(w:K5Words, l:lastMatch,"","")
    let w:K5Words = substitute(w:K5Words, l:singleMatch,"","")

    let w:K6Words = substitute(w:K6Words, l:middleMatch,'\\|',"g")
    let w:K6Words = substitute(w:K6Words, l:middleMatch,'\\|',"g")
    let w:K6Words = substitute(w:K6Words, l:firstMatch,"","")
    let w:K6Words = substitute(w:K6Words, l:lastMatch,"","")
    let w:K6Words = substitute(w:K6Words, l:singleMatch,"","")

    let w:K7Words = substitute(w:K7Words, l:middleMatch,'\\|',"g")
    let w:K7Words = substitute(w:K7Words, l:middleMatch,'\\|',"g")
    let w:K7Words = substitute(w:K7Words, l:firstMatch,"","")
    let w:K7Words = substitute(w:K7Words, l:lastMatch,"","")
    let w:K7Words = substitute(w:K7Words, l:singleMatch,"","")

    let w:K8Words = substitute(w:K8Words, l:middleMatch,'\\|',"g")
    let w:K8Words = substitute(w:K8Words, l:middleMatch,'\\|',"g")
    let w:K8Words = substitute(w:K8Words, l:firstMatch,"","")
    let w:K8Words = substitute(w:K8Words, l:lastMatch,"","")
    let w:K8Words = substitute(w:K8Words, l:singleMatch,"","")

    let w:AllWords = substitute(w:AllWords, l:middleMatch,'\\|',"g")
    let w:AllWords = substitute(w:AllWords, l:middleMatch,'\\|',"g")
    let w:AllWords = substitute(w:AllWords, l:firstMatch,"","")
    let w:AllWords = substitute(w:AllWords, l:lastMatch,"","")
    let w:AllWords = substitute(w:AllWords, l:singleMatch,"","")
endfunction


function! DelPattern()
    let w:toBeDeleted = @*
    echo w:toBeDeleted
    let w:dupa = w:toBeDeleted
    call FindPattern(w:toBeDeleted)
    call DeleteFromBuffers(w:toBeDeleted)
endfunction

function! ReColor()
    if exists("g:globalMatches")
        call setmatches(g:globalMatches)
    endif
endfunction


function! BufferDisplay()
    let winnum = bufwinnr(g:winBufName)
    if winnum != -1
        "przejdz do okna gdzie wyswietlany jest bufor
        exe winnum . 'wincmd w'
        "jesli okno jest otwarte to zamykamy
        if winnr() == winnum
            "zapisanie bufora vimowskiego do zmiennej
            let lines = getbufline(bufnr(g:winBufName), 1, "$")
            let g:buforek = join(lines,'\|')
            let g:buforek = substitute(g:buforek, '\(\\|\)\{2, 99}','\\|',"g")
            let g:buforek = substitute(g:buforek, '\\|$','',"g")
            let g:buforek = substitute(g:buforek, '^\\|','',"g")
            close
        endif
    else
        "tworzenie nowego okna, po lewej o szerokosc 20 i nazwie bufName
        execute 'vertical aboveleft 20 split ' . g:winBufName
        "nadanie oknu szerokosci 20
        "execute '20 wincmd |'
        "jakies ustawienia dla vimowskiego bufora
        setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
        "potrzebne do setline
        let counter = 1
        "podzielenie bufora na odzielne linijki
        let costam = split(g:buforek,'\\|')
        for value in costam
            "printownie do nowego okna
            call setline(counter, value)
            let counter=counter+1
        endfor
        "przejscie do okna z syslogami dla wygody przegladania
        exe 'wincmd l'
        "source $VIM_S1_COLORS/BTSLog.vim
    endif
endfunction





















vmap <silent> <F3>  :call !MySearch()<CR><CR><CR><CR>
nmap <silent> <F3>  :call !MySearch()<CR><CR><CR>
nmap <silent> <F8> :call BufferDisplay()<CR><CR>
vmap <silent> <F8> :call BufferDisplay()<CR><CR>
nmap <silent> <F5> :call BtsStatus()<CR><CR>
vmap <silent> <F3>  :call MySearch2()<CR><CR>
nmap <silent> <F3>  :call MySearch2()<CR><CR>
vmap <silent> <F9>  :call MySearch()<CR><CR>
nmap <silent> <F9>  :call MySearch()<CR><CR>
nmap <silent> <F6> :call MySearchTag()<CR><CR>
vmap <silent> <C-d> :call MyDelete()<CR><CR>
nmap <silent> ;k :call TagAllMatches()<CR>
vmap <silent> ;k :call TagAllMatches()<CR>
nmap <silent> ;K :call RemoveTagFromAllMatches()<CR>
vmap <silent> ;K :call RemoveTagFromAllMatches()<CR>
nmap <silent> ;i :call TagOneLine()<CR>
nmap <silent> ;I :call RemoveTagFromLine()<CR>
vmap <silent> ;i :call TagOneLine()<CR>
vmap <silent> ;I "+y <ESC> qaq :call RemoveTagFromLine()<CR>
"nmap <C-LeftMouse> :call GoToLine(v:count)
nmap <C-LeftMouse>  :GoTo<CR>
"command! -count MY echo [<count>]
command! -range -bang -nargs=* MY echo [<bang>0, <line1>, <line2>, <count>, <q-args>]
"command! -range -bang -nargs=* GoTo echo [<count>]
command! -range -bang -nargs=* GoTo call GoToLine(<bang>0, <line1>, <line2>, <count>, <q-args>)
"command! -nargs=* -count GoTo call GoToLine(<count>)

"vmap <silent> <C-f> "+y <ESC> :call MyMultiCopy()<CR><CR>
vmap <C-f> :call MyMultiCopy()<CR><CR>
"czyszczenie sercz bufer klin
nmap <silent> <C-w>sbc :let g:buforek = "" <CR><CR>

"dodawanie do kolorowania
vmap <silent> <C-W>1 :call MyMultiColor("K1")<CR><CR>
vmap <silent> <C-W>2 :call MyMultiColor("K2")<CR><CR>
vmap <silent> <C-W>3 :call MyMultiColor("K3")<CR><CR>
vmap <silent> <C-W>4 :call MyMultiColor("K4")<CR><CR>
vmap <silent> <C-W>5 :call MyMultiColor("K5")<CR><CR>
vmap <silent> <C-W>6 :call MyMultiColor("K6")<CR><CR>
vmap <silent> <C-W>7 :call MyMultiColor("K7")<CR><CR>
vmap <silent> <C-W>8 :call MyMultiColor("K8")<CR><CR>

"szukanie wszystkich lub niektorych zaznaczen
nmap <silent> <C-W>s1 :let @/=w:K1Words<CR><CR>
nmap <silent> <C-W>s2 :let @/=w:K2Words<CR><CR>
nmap <silent> <C-W>s3 :let @/=w:K3Words<CR><CR>
nmap <silent> <C-W>s4 :let @/=w:K4Words<CR><CR>
nmap <silent> <C-W>s5 :let @/=w:K5Words<CR><CR>
nmap <silent> <C-W>s6 :let @/=w:K6Words<CR><CR>
nmap <silent> <C-W>s7 :let @/=w:K7Words<CR><CR>
nmap <silent> <C-W>s8 :let @/=w:K8Words<CR><CR>
nmap <silent> <C-W>sa :let @/=w:AllWords<CR><CR>

"kolorowanie w innych tablicach
nmap <silent> <C-W>ca :call ReColor()<CR><CR>

"kasowanie kolorowania, czyszczenie buforow
nmap <silent> <C-W>cc :call CleanBuffers()<CR><CR>

"skopiowanie zaznaczonego fragmentu i usuniecie z zaznaczen jesli sitnieje
vmap <silent> <C-W>d "+y <ESC> :call DelPattern()<CR><CR>

"potrzebne zeby wygodne byly skroty z kilkoma klawiszami
set notimeout
