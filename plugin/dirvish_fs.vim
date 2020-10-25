nnoremap <silent> <Plug>DirvishFsRemove :call dirvish_fs#fs#remove()<cr>
nnoremap <silent> <Plug>DirvishFsAdd :call dirvish_fs#fs#add()<cr>
nnoremap <silent> <Plug>DirvishFsMove :call dirvish_fs#fs#move()<cr>
nnoremap <silent> <Plug>DirvishFsCopy :call dirvish_fs#fs#copy()<cr>

let defaults_enabled = get(g:, 'dirvish_fs_default_mappings', 1)

if defaults_enabled
    autocmd FileType dirvish call dirvish_fs#mappings#set()
endif

