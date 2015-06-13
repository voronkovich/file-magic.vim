# Vim file magic

Vim plugin for quick creating files.

## Basic usage

Suppose that you have added this magic spells into you `.vimrc`:

```vim
let g:file_magic_items = {
    \ 'apachevhost': '/etc/apache2/sites-available/%s.conf',
    \ 'sfview': 'app/Resources/views/%s.html.twig',
    \ 'sfcontroller': 'src/AppBundle/Controller/%sController.php',
    \ }
```

Then run command `:FileMagic sfview user/login` and you will get `app/Resources/views/user/login.html.twig`

## Installation

For creating parent directories this plugin requires [easydir](https://github.com/duggiefresh/vim-easydir), [vim-mkdir](https://github.com/pbrisbin/vim-mkdir) or another plugin with the same features.

### Using [pathogen](https://github.com/tpope/vim-pathogen)

``` sh
git clone git://github.com/voronkovich/file-magic.vim ~/.vim/bundle/file-magic.vim
```

### Using [vundle](https://github.com/gmarik/vundle)

Add to vimrc:

``` vim
Bundle 'voronkovich/file-magic.vim'
```

## License

Copyright (c) Voronkovich Oleg.  Distributed under the same terms as Vim itself.
See `:help license`.
