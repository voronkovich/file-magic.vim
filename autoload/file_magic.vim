if exists('g:file_magic_autoloaded')
   finish 
endif

let g:file_magic_autoloaded = 1

fun! file_magic#create_file(key, ...)
    let file = s:resolve_file(a:key, a:000)

    if !empty(file) 
        execute ':' . g:file_magic_open_command . ' ' . file
    endif
endfun

fun s:resolve_file(key, values)
    if !has_key(g:file_magic_spells, a:key)
        throw "FileMagic: spell with a key " . a:key . " does not exist"
    endif

    let spell = get(g:file_magic_spells, a:key)

    if stridx(spell, '!') == 0
        let file = call(strpart(spell, 1), [ a:key ] + a:values)
    else
        let file = s:printfl(spell, a:values)
    endif

    return file
endfun

fun s:printfl(expr, values)
    return call('printf', [ a:expr ] + a:values)
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
