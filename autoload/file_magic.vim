if exists('g:file_magic_autoloaded')
   finish 
endif

let g:file_magic_autoloaded = 1

fun! file_magic#create_file(key, value)
    if !has_key(g:file_magic_spells, a:key)
        throw "FileMagic: Entry with key " . a:key . " does not exist"
    endif

    let item = get(g:file_magic_spells, a:key)

    if stridx(item, '!') == 0
        let file = call(strpart(item, 1), [ a:key, a:value ])
    else
        let file = printf(item, a:value)
    endif

    execute g:file_magic_open_command . ' ' . file
endfun

fun! file_magic#add_spell(key, value)
    let g:file_magic_spells[a:key] = a:value
endfun

fun! file_magic#remove_spell(key)
    remove(g:file_magic_spells, a:key)
endfun

fun! file_magic#get_spells_keys(...)
    return keys(g:file_magic_spells)
endfun