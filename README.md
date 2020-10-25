# dirvish-fs.vim

dirvish-fs is a complimentary plugin to [vim-dirvish](https://github.com/justinmk/vim-dirvish). It has two features

- Shortcuts to add/move/copy/remove nodes in dirvish buffers.

## Installation

Install both using your favorite plugin manager. An example using [vim-plug](https://github.com/junegunn/vim-plug):

```viml
Plug 'justinmk/vim-dirvish'
Plug 'antonk52/dirvish-fs.vim'
```

## Mappings

### In dirvish buffer

- <kbd>ma</kbd> - add node, end with `/` to add directory
- <kbd>mm</kbd> - move node
- <kbd>mc</kbd> - copy node
- <kbd>dd</kbd> - remove node

### Custom mappings

To disable the default mappings add the following to your `.vimrc`

```viml
" disables default mappings
let g:dirvish_fs_default_mappings = 0

" sets custom mappings
function! DivrishMappings()
    nmap <buffer> <silent>dd <Plug>DirvishFsRemove
    nmap <buffer> <silent>ma <Plug>DirvishFsAdd
    nmap <buffer> <silent>mm <Plug>DirvishFsMove
    nmap <buffer> <silent>mc <Plug>DirvishFsCopy
endfunction

autocmd FileType dirvish call DivrishMappings()
```

## Why?

It was the only thing stopping me from jumping off bloated [NERDTree](https://github.com/preservim/nerdtree) plugin.

Pull requests are welcome
