return {
  -- https://github.com/nvim-telescope/telescope.nvim
  --
  -- Ohter usage:
  --
  -- * <C-x> open file as a split
  -- * <C-v> open file as a vsplit
  -- * <C-t> open file in a tab
  -- * <C-Q> send all items to quickfix
  'nvim-telescope/telescope.nvim',
  tag = '0.1.1',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- There is no auto bulding. You have to call build manually.
    -- In addition, lazy would not automatically build again if the plugin is already installed or not updated,
    -- so to re-build, delete the folder ~/.local/share/nvim/lazy/
    -- https://github.com/nvim-telescope/telescope-fzf-native.nvim/issues/96
    -- :Lazy build telescope-fzf-native.nvim
    {"nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = false}
  },
  config = function()
    local builtin = require('telescope.builtin')
    local theme = require('telescope.themes').get_ivy()

    vim.keymap.set('n', '<leader>f', function() builtin.find_files(theme) end)
    vim.keymap.set('n', '<leader>b', function() builtin.buffers(theme) end)
    vim.keymap.set('n', '<leader>A', function() builtin.grep_string(theme) end)
    vim.keymap.set('n', '<leader>a', function() builtin.live_grep(theme) end)

    vim.keymap.set('n', '<leader>tc', function() builtin.builtin(theme) end)
    vim.keymap.set('n', '<leader>th', function() builtin.help_tags(theme) end)

    vim.keymap.set('n', '[l', function() builtin.diagnostics(theme) end)

    --  Lists buffer's (current file's) git commits with diff preview and checks them out on <cr>
    --  :nnoremap <Leader>ppp :Telescope git_bcommits theme=ivy<CR>
    --  :nnoremap <Leader>ppp :Telescope git_status theme=ivy<CR>
    --  :nnoremap <Leader>ppp :Telescope commands theme=ivy<CR>

    require('telescope').setup {
      extensions = {
        -- telescope-fzf-native.nvim
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case" -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        }
      }
    }

    -- telescope-fzf-native.nvim
    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    require('telescope').load_extension('fzf')
  end
}
