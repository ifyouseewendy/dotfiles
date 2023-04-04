return {
  "williamboman/mason.nvim",
  lazy = false,
  priority = 900, -- Load before nvim-lspconfig. Default priority 50.
  dependencies = {
    "williamboman/mason-lspconfig.nvim"
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = { "pyright" },
    }
  end
}
