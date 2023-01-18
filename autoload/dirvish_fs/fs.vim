let s:cmd = {
    \ 'add_file': 'touch',
    \ 'add_dir': 'mkdir -p',
    \ 'move': 'mv',
    \ 'remove': 'rm -rf',
    \ 'copy': 'cp -a',
    \ }

let s:msg = {
    \ 'add_node': 'Enter the new node path: ',
    \ 'exists': 'Already exists',
    \ 'remove_file': 'Are you sure you want to delete it? [y/N]',
    \ 'remove_dir': 'To delete, type "yes": ',
    \ 'aborted': 'aborted'
    \ }

" if the destination is in non existing directory - create it
function! PrepareDestDirectory(path) abort
    " TODO: make this windows friendly
    let path_sep = '/'
    let list = split(a:path, path_sep)
    " viml cuts off the first slash
    let dir_path = path_sep . join(list[:-2], path_sep)

    if !isdirectory(dir_path)
        execute('silent !' . s:cmd.add_dir . ' ' . dir_path)
    endif

    return 1
endfunction

function! dirvish_fs#fs#esc(path)
    return escape(a:path, ' ()')
endfunction

function! dirvish_fs#fs#add() abort
    let current_line = trim(getline('.'))
    let is_on_directory = match(current_line, '\/$', '') != -1
    let new_path = dirvish_fs#fs#esc(input(s:msg.add_node, expand('%'), 'file'))
    let is_file = match(new_path, '\/$', '') == -1
    let cmd = is_file ? s:cmd.add_file : s:cmd.add_dir
    call PrepareDestDirectory(new_path)
    if filereadable(new_path) || isdirectory(new_path)
        redraw!
        echo s:msg.exists
    else
        execute('silent !' . cmd . ' ' . substitute(new_path, '\/$', '', ''))
        redraw!
    endif
endfunction

function! dirvish_fs#fs#remove() abort
    let target = trim(getline('.'))
    let is_file = match(target, '\/$', '') == -1
    let rm_cmd = 'rm ' . (is_file ? '' : '-rf ')
    let confirmed = 0

    if is_file
        echo s:msg.remove_file
        let choice = nr2char(getchar())
        let confirmed = choice ==# 'y'
    else
        let choice = input(s:msg.remove_dir)
        let confirmed = choice ==# 'yes'
    endif

    if confirmed
        execute('silent !' . s:cmd.remove . ' ' . target)
        " redraws the buffer and removes `Press ENTER or type command to continue`
        redraw!
    else
        redraw!
        echo s:msg.aborted
    endif
endfunction

function! dirvish_fs#fs#move() abort
    let old_path = dirvish_fs#fs#esc(trim(getline('.')))
    let new_path = dirvish_fs#fs#esc(input(s:msg.add_node, old_path, 'file'))
    call PrepareDestDirectory(new_path)
    execute('silent !' . s:cmd.move . ' ' . old_path . ' ' . new_path)
    redraw!
endfunction

function! dirvish_fs#fs#copy() abort
    let old_path = dirvish_fs#fs#esc(trim(getline('.')))
    let new_path = dirvish_fs#fs#esc(input(s:msg.add_node, old_path, 'file'))
    call PrepareDestDirectory(new_path)
    execute('silent !' . s:cmd.copy . ' ' . old_path . ' ' . new_path)
    redraw!
endfunction
