# dirvish-fs.vim

dirvish-fs is a complimentary plugin to [vim-dirvish](https://github.com/justinmk/vim-dirvish). It has two features

- Shortcuts to add/move/copy/remove nodes in dirvish buffers.
- Shortcut to jump to the current directory and up a directory.

## Installation

Install both using your favorite plugin manager. An example using [vim-plug](https://github.com/junegunn/vim-plug):

```viml
Plug 'justinmk/vim-dirvish'
Plug 'antonk52/dirvish-fs.vim'
```

## Mappings

### In dirvish buffer

- <kbd>ma</kbd> - add node, end with `/` to add directory
- <kbd>mm</kbd> - mode node
- <kbd>mc</kbd> - copy node
- <kbd>dd</kbd> - remove node
- <kbd>-</kbd> - go up a directory

### In any buffer

- <kbd>-</kbd> - open current directory from a file buffer

## Why?

It was the only thing stopping me from jumping off bloated [NERDTree](https://github.com/preservim/nerdtree) plugin.

Pull requests are welcome
