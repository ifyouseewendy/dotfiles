return {
  "williamboman/mason.nvim",
  lazy = false,
  priority = 900, -- Load before nvim-lspconfig. Default priority 50.
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
    "WhoIsSethDaniel/mason-tool-installer.nvim"
  },
  config = function()
    require("mason").setup()
    require('mason-tool-installer').setup {
      -- a list of all tools you want to ensure are installed upon
      -- start; they should be the names Mason uses for each tool
      ensure_installed = {
        -- Python
        "pyright",
        "ruff",
        "black",

        -- Lua
        "luaformatter"
      }
  }
    require("mason-lspconfig").setup()
  end
}
