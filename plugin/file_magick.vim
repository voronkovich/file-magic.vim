if exists('g:file_magic_loaded')
   finish 
endif

let g:file_magic_loaded = 1

if !exists('g:file_magic_items')
    let g:file_magic_items = {}
endif

command! -nargs=* -complete=customlist,file_magic#get_items_keys FileMagicCreate call file_magic#create_file(<f-args>)
command! -nargs=* FileMagicAddItem call file_magic#add_item(<f-args>)
command! -nargs=1 -complete=customlist,file_magic#get_items_keys FileMagicRemoveItem call file_magic#remove_item(<f-args>)
