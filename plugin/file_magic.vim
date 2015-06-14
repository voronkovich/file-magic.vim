if exists('g:file_magic_loaded')
   finish 
endif

let g:file_magic_loaded = 1

if !exists('g:file_magic_spells')
    let g:file_magic_spells = {}
endif

if !exists('g:file_magic_open_command')
    let g:file_magic_open_command = ':e'
endife

command! -nargs=* -complete=customlist,file_magic#get_spells_keys FileMagic call file_magic#create_file(<f-args>)
command! -nargs=* FileMagicAddSpell call file_magic#add_spell(<f-args>)
command! -nargs=1 -complete=customlist,file_magic#get_spells_keys FileMagicRemoveSpell call file_magic#remove_spell(<f-args>)
