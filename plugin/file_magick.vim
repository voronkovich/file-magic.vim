if exists('g:file_magick_loaded')
   finish 
endif

let g:file_magick_loaded = 1

if !exists('g:file_magick_items')
    let g:file_magick_items = {}
endif

command! -nargs=* -complete=customlist,file_magick#get_items_keys FileMagickCreate call file_magick#create_file(<f-args>)
command! -nargs=* FileMagickAddItem call file_magick#add_item(<f-args>)
command! -nargs=1 -complete=customlist,file_magick#get_items_keys FileMagickRemoveItem call file_magick#remove_item(<f-args>)
