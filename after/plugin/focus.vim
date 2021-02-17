if exists('g:focus_loaded') | finish | endif

let g:focus_loaded = 1 "Don't Reload Twice"
let g:focus_enabled = 1

"A vim best practise
let s:save_cpo = &cpo
set cpo&vim


"Adding command do DISABLE focus.
"TODO--> [beauwilliams] --> Add hot toggling. The issue is, how do we know
"what size to normalise the splits back to? If we run DisableToggle before
"setting up spilts we are all good. Need to think about what to do when splits
"already maximised. Perhaps decide on default width + height to return them to
"but that is screen size dependent. Maybe store screen sizes but idk..
command! -nargs=0 DisableFocus call DisableFocus()

function! DisableFocus() abort
    if g:focus_enabled == 0
        return
    else
    let g:focus_enabled = 0
endif
endfunction


"Init focus, set autocmds and start the resizer

" https://old.reddit.com/r/neovim/comments/j8jaoo/i_want_to_check_if_i_have_nvim_05_or_not/
if has("nvim") && has("nvim-0.0.5") 
    call v:lua.require('focus').focus_init()
else
    call luaeval("require ('focus').focus_init()")
endif



let &cpo = s:save_cpo
unlet s:save_cpo
