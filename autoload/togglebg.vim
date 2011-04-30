" Toggle Background
" Modified:     2011 Apr 29
" Maintainer:   Ethan Schoonover
" License:      OSI approved MIT license

if exists("g:loaded_togglebg")
    finish
endif
let g:loaded_togglebg = 1

" noremap is a bit misleading here if you are unused to vim mapping.
" in fact, there is remapping, but only of script locally defined remaps, in
" this case <SID>TogBG. The <script> argument modifies the noremap scope in
" this regard (and the noremenu below).
noremap  <script> <Plug>ToggleBackground <SID>TogBG
noremap! <script> <Plug>ToggleBackground <SID>TogBG
anoremenu <script> Window.Toggle\ Background <SID>TogBG
tmenu Window.Toggle\ Background Toggle light and dark background modes
anoremenu <script> ToolBar.togglebg <SID>TogBG
tmenu ToolBar.togglebg Toggle light and dark background modes
noremap  <silent> <SID>TogBG :<C-U>call <SID>TogBG()<CR>
inoremap <silent> <SID>TogBG <C-/><C-O>:call <SID>TogBG()<CR>

function! s:TogBG()
    let &background = ( &background == "dark"? "light" : "dark" )
    if exists("g:colors_name")
        exe "colorscheme " . g:colors_name
    endif
endfunction

command! ToggleBG :call s:TogBG()

function! ToggleBackground()
    echo "Please update your ToggleBackground mapping. ':help togglebg' for information."
endfunction

function! togglebg#map(mapActivation)
    exe "map  ".a:mapActivation." <Plug>ToggleBackground"
    exe "imap ".a:mapActivation." <Plug>ToggleBackground"
endfunction

if !exists("no_plugin_maps") && !hasmapto('<Plug>ToggleBackground') && mapcheck('<F5>').mapcheck('<F5>','i') ==# ''
    call togglebg#map("<F5>")
endif
