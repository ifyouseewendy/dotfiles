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
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    local theme = require('telescope.themes').get_ivy()

    vim.keymap.set('n', '<leader>f',  function() builtin.git_files(theme) end)
    vim.keymap.set('n', '<leader>b', function() builtin.buffers(theme) end)
    vim.keymap.set('n', '<leader>A',  function() builtin.grep_string(theme) end)
    vim.keymap.set('n', '<leader>a',  function() builtin.live_grep(theme) end)

    vim.keymap.set('n', '<leader>tc', function() builtin.builtin(theme) end)
    vim.keymap.set('n', '<leader>th', function() builtin.help_tags(theme) end)

    vim.keymap.set('n', '[l', function() builtin.diagnostics(theme) end)

    --  Lists buffer's (current file's) git commits with diff preview and checks them out on <cr>
    --  :nnoremap <Leader>ppp :Telescope git_bcommits theme=ivy<CR>
    --  :nnoremap <Leader>ppp :Telescope git_status theme=ivy<CR>
    --  :nnoremap <Leader>ppp :Telescope commands theme=ivy<CR>
  end
}


