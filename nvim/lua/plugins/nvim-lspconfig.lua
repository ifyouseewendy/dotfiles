return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    -- Setup language servers.
    local lspconfig = require('lspconfig')

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local on_attach = function(client, bufnr)
      local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
      end

      -- Mappings.
      local opts = {noremap = true, silent = true}
      buf_set_keymap('n', '<leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', '<leader>gi', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
      buf_set_keymap('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      buf_set_keymap('n', '<leader>gc', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      -- buf_set_keymap('n', '<leader>gi', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      -- buf_set_keymap('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      buf_set_keymap('n', '<leader>gS', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      buf_set_keymap('n', '<leader>gR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      buf_set_keymap('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      buf_set_keymap('n', '[g', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
      buf_set_keymap('n', ']g', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)

      -- Set some keybinds conditional on server capabilities
      if client.server_capabilities.document_formatting then
        buf_set_keymap("n", "<leader>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
      elseif client.server_capabilities.document_range_formatting then
        buf_set_keymap("n", "<leader>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
      end
    end

    -- Hook nvim-cmp
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Specify a virtual env for Pyright
    -- https://github.com/neovim/nvim-lspconfig/issues/500#issuecomment-876700701
    local util = require('lspconfig/util')
    local path = util.path
    local function get_python_path(workspace)
      -- Use activated virtualenv.
      if vim.env.VIRTUAL_ENV then
        return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
      end

      -- Find and use virtualenv via poetry in workspace directory.
      local match = vim.fn.glob(path.join(workspace, 'poetry.lock'))
      if match ~= '' then
        local venv = vim.fn.trim(vim.fn.system('poetry env info -p'))
        return path.join(venv, 'bin', 'python')
      end

      -- Fallback to system Python.
      return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
    end

    -- Set up lspconfig for pyright
    lspconfig.pyright.setup {
      on_attach = on_attach,
      on_init = function(client)
          client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
      end,
      capabilities = capabilities
    }

    -- Show diagnostic source
    vim.diagnostic.config({
        virtual_text={ source=true }
    })
  end
}
