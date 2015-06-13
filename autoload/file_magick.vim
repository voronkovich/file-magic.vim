if exists('g:file_magick_autoloaded')
   finish 
endif

let g:file_magick_autoloaded = 1

fun! file_magick#create_file(key, value)
    if !has_key(g:file_magick_items, a:key)
        throw "FileMagick: Entry with key " . a:key . " does not exist"
    endif

    let item = get(g:file_magick_items, a:key)

    if stridx(item, '!') == 0
        let file = call(strpart(item, 1), [ a:key, a:value ])
    else
        let file = printf(item, a:value)
    endif

    execute ':e ' . file
endfun

fun! file_magick#add_item(key, value)
    let g:file_magick_items[a:key] = a:value
endfun

fun! file_magick#remove_item(key)
    remove(g:file_magick_items, a:key)
endfun

fun! file_magick#get_items_keys(...)
    return keys(g:file_magick_items)
endfun
