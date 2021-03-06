# Vim file magic

Vim plugin for quick creating files.

## Basic usage

Suppose that you have added this magic spells into you `.vimrc`:

```vim
" Note %s in strings?
let g:file_magic_spells = {
    \ 'apachevhost': '/etc/apache2/sites-available/%s.conf',
    \ 'sfview': 'app/Resources/views/%s.html.twig',
    \ 'sfcontroller': 'src/AppBundle/Controller/%sController.php',
    \ 'tmp': '/tmp/%s/%s.txt'
\ }
```

Now if you run a command:

```vim
:FileMagic sfview user/login
```

you will get a file `app/Resources/views/user/login.html.twig` opened in the Vim.

## Installation

For creating parent directories this plugin requires [easydir](https://github.com/duggiefresh/vim-easydir), [vim-mkdir](https://github.com/pbrisbin/vim-mkdir) or another plugin with the same features.

### Using [pathogen](https://github.com/tpope/vim-pathogen)

``` sh
git clone https://github.com/voronkovich/file-magic.vim.git ~/.vim/bundle/file-magic.vim
```

### Using [vundle](https://github.com/gmarik/vundle)

Add to your `.vimrc`:

``` vim
Bundle 'voronkovich/file-magic.vim'
```

## Configuration

Setting a default command for opening a created file:

```vim
g:file_magic_open_command = 'vsplit' " 'e' by default
```

Setting the `FileMagic` command alias:

```vim
g:file_magic_command_alias = 'Create'
```

Add callback function instead of a spell string:

```vim
g:file_magic_spells = {
    \ 'note': '!CreateNote'
\ }

...

" a:key will be equal 'note'
fun! CreateNote(key, title)
    return printf('~/notes/%s-%s.txt', a:title, strftime('%FT%T%z'))
endfun

```

## License

Copyright (c) Voronkovich Oleg.  Distributed under the same terms as Vim itself.
See `:help license`.
