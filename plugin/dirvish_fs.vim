autocmd FileType dirvish call dirvish_fs#mappings#set()

" vim-vinegar in a nutshell
nnoremap <silent> - :call dirvish#open(expand('%'))<cr>
