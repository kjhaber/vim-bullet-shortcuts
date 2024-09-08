" vim-bullet-shortcuts
" This vim plugin provides a set of vim functions and mappings useful when
" working with bullet list characters, such as asterisks and dashes.

if exists('g:loaded_vim_bullet_shortcuts')
  finish
endif
let g:loaded_vim_bullet_shortcuts = 1

" Change bullet list character
function! s:BulletChange(newChar)
  call setline(line('.'), substitute(getline('.'), '\v^( *)([^ ]+)(.*)$', '\1'.a:newChar.'\3', ''))
endfunction
command! -nargs=1 -range BulletChange <line1>,<line2>call <SID>BulletChange(<q-args>)

" Convenience commands for common bullet changes
command! -range BulletChangeDash :<line1>,<line2>BulletChange -
command! -range BulletChangeStar :<line1>,<line2>BulletChange *
command! -range BulletChangePlus :<line1>,<line2>BulletChange +
command! -range BulletChangeGt   :<line1>,<line2>BulletChange >

" Command for switching current line bullet character between asterisk ("*")
" and dash ("-")
function! s:BulletToggle()
  " switch between '*' and '-' bullet characters
  if match(getline('.'), '\v^( *)\*') != -1
    call s:BulletChange('-')
  elseif match(getline('.'), '\v^( *)\-') != -1
    call s:BulletChange('*')
  else
    echom "No dash or asterisk bullet found on line"
  endif
endfunction
command! -range BulletToggle <line1>,<line2>call <SID>BulletToggle()

" For some reason I haven't been able to figure out, there is a delay when the
" <leader>bb mappings call BulletToggle directly.  Adding this extra indirection
" makes the leader mapping action take effect immediately.
function! s:BulletToggleNow()
  BulletToggle
endfunction
command! -range BulletToggleNow <line1>,<line2>call <SID>BulletToggleNow()

" Command for indenting the current line and toggling the current bullet
" character
function! s:BulletToggleIndent()
  >
  BulletToggle
endfunction

" Command for outdenting (un-indenting) the current line and toggling
" the current bullet character function! s:BulletToggleIndent()
function! s:BulletToggleOutdent()
  <
  BulletToggle
endfunction
command! -range BulletToggleIndent <line1>,<line2>call <SID>BulletToggleIndent()
command! -range BulletToggleOutdent <line1>,<line2>call <SID>BulletToggleOutdent()

if !exists('g:vim_bullet_shortcuts_map_keys')
  let g:vim_bullet_shortcuts_map_keys = 1
endif

" Set default mappings
" All default mappings call repeat#set from vim-repeat
if g:vim_bullet_shortcuts_map_keys
  nmap <silent> <Plug>BulletChangeDash :BulletChangeDash<CR>:call repeat#set("\<lt>Plug>BulletChangeDash")<CR>
  vmap <silent> <Plug>BulletChangeDash :'<,'>BulletChangeDash<CR>:call repeat#set("\<lt>Plug>BulletChangeDash")<CR>
  nmap <silent> <Leader>b- <Plug>BulletChangeDash
  vmap <silent> <Leader>b- <Plug>BulletChangeDash


  nmap <silent> <Plug>BulletChangeStar :BulletChangeStar<CR>:call repeat#set("\<lt>Plug>BulletChangeStar")<CR>
  vmap <silent> <Plug>BulletChangeStar :'<,'>BulletChangeStar<CR>:call repeat#set("\<lt>Plug>BulletChangeStar")<CR>
  nmap <silent> <Leader>b* <Plug>BulletChangeStar
  vmap <silent> <Leader>b* <Plug>BulletChangeStar

  nmap <silent> <Plug>BulletChangePlus :BulletChangePlus<CR>:call repeat#set("\<lt>Plug>BulletChangePlus")<CR>
  vmap <silent> <Plug>BulletChangePlus :'<,'>BulletChangePlus<CR>:call repeat#set("\<lt>Plug>BulletChangePlus")<CR>
  nmap <silent> <Leader>b+ <Plug>BulletChangePlus
  vmap <silent> <Leader>b+ <Plug>BulletChangePlus

  nmap <silent> <Plug>BulletChangeGt :BulletChangeGt<CR>
        \:call repeat#set("\<lt>Plug>BulletChangeGt")<CR>
  vmap <silent> <Plug>BulletChangeGt :'<,'>BulletChangeGt<CR>
        \:call repeat#set("\<lt>Plug>BulletChangeGt")<CR>
  nmap <silent> <Leader>b> <Plug>BulletChangeGt
  vmap <silent> <Leader>b> <Plug>BulletChangeGt

  nmap <silent> <Plug>BulletToggleNow :BulletToggleNow<CR>
        \:call repeat#set("\<lt>Plug>BulletToggleNow")<CR>
  vmap <silent> <Plug>BulletToggleNow :'<,'>BulletToggleNow<CR>
        \:call repeat#set("\<lt>Plug>BulletToggle")<CR>
  nmap <silent> <Leader>bb <Plug>BulletToggleNow
  vmap <silent> <Leader>bb <Plug>BulletToggleNow

  nmap <silent> <Plug>BulletToggleIndent :BulletToggleIndent<CR>
        \:call repeat#set("\<lt>Plug>BulletToggleIndent")<CR>
  vmap <silent> <Plug>BulletToggleIndent :'<,'>BulletToggleIndent<CR>
        \:call repeat#set("\<lt>Plug>BulletToggleIndent")<CR>
  nmap <silent> <Leader>bi <Plug>BulletToggleIndent
  vmap <silent> <Leader>bi <Plug>BulletToggleIndent

  nmap <silent> <Plug>BulletToggleOutdent :BulletToggleOutdent<CR>
        \:call repeat#set("\<lt>Plug>BulletToggleOutdent")<CR>
  vmap <silent> <Plug>BulletToggleOutdent :'<,'>BulletToggleOutdent<CR>:call repeat#set("\<lt>Plug>BulletToggleOutdent")<CR>
  nmap <silent> <Leader>bo <Plug>BulletToggleOutdent
  vmap <silent> <Leader>bo <Plug>BulletToggleOutdent
endif

