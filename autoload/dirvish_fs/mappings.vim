function! dirvish_fs#mappings#set() abort
    nnoremap <buffer> <silent>dd :call dirvish_fs#fs#remove()<cr>
    nnoremap <buffer> <silent>ma :call dirvish_fs#fs#add()<cr>
    nnoremap <buffer> <silent>mm :call dirvish_fs#fs#move()<cr>
    nnoremap <buffer> <silent>mc :call dirvish_fs#fs#copy()<cr>
endfunction
