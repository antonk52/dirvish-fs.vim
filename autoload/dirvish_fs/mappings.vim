function! dirvish_fs#mappings#set() abort
    nmap <buffer> <silent>dd <Plug>DirvishFsRemove
    nmap <buffer> <silent>ma <Plug>DirvishFsAdd
    nmap <buffer> <silent>mm <Plug>DirvishFsMove
    nmap <buffer> <silent>mc <Plug>DirvishFsCopy
endfunction
