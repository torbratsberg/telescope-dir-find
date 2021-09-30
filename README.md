# Telescope Dir Find
Use *telescope.nvim* to make a list of directories you want to fuzzy find in.

## Gettings started

### Dependencies
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [sharkdp/fd](https://github.com/sharkdp/fd)

### Installation
- Using [vim-plug](https://github.com/junegunn/vim-plug)
```viml
Plug 'torbratsberg/telescope-dir-find'
Plug 'torbratsberg/telescope-dir-find'
```

### Keymaps
```viml
nmap <leader>nf :lua require('dirfind').search_dirs()<cr>
nmap <leader>nd :lua require('dirfind').select_dirs()<cr>
```

### Usage
- If using keymaps above, press `<leader>nd` and find the directories you want to search in.
- Select them by pressing `<tab>`.
- When done with selecting dirs, press `<cr>` / `<Enter>`
- Press `<leader>nf` to search in your selected folders.

### Extras
- Set default dirs to search in
```viml
let g:search_dirs = [LIST OF DIRS TO SEARCH IN BY DEFAULT]
```
