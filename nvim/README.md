# Neovim setup

Just upgraded my Neovim settings with the help of [djensenius/dotfiles](https://github.com/djensenius/dotfiles).
A new world is open with modern Neovim plugins and componentized configurations. 

* Use [lazy.nvim](https://github.com/folke/lazy.nvim) to manage plugins
* Use [mason.nvim](https://github.com/williamboman/mason.nvim) to manage LSP, linters and fixers
* Use [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) to configure LSP
* Use [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) to configure linters and fixers
* Use [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) to auto complete
* Use [nvim-treesitter.lua](nvim-treesitter) to unblock better language support
* Use [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) as the command pallette to find, search and pick
* Use [which-key](https://github.com/folke/which-key.nvim) to deal with key mappings

Usage

```
ln -svf ~/.dotfiles/nvim ~/.config/nvim
```

Reference

* [jdhao/nvim-config](https://github.com/jdhao/nvim-config)
* [nvim-lua/kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
* [LazyVim/LazyVim](https://github.com/LazyVim/LazyVim)
