return {
	"williamboman/mason.nvim",
	lazy = false,
	priority = 900, -- Load before nvim-lspconfig. Default priority 50.
	dependencies = {
		"williamboman/mason-lspconfig.nvim", -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- require("mason").setup()
		require("mason").setup({
			log_level = vim.log.levels.DEBUG,
		})

		require("mason-tool-installer").setup({
			-- a list of all tools you want to ensure are installed upon
			-- start; they should be the names Mason uses for each tool
			ensure_installed = {
				-- Python
				"pyright",
				"ruff",
				"debugpy",
				-- Lua
				"stylua",
			},
		})
		require("mason-lspconfig").setup()
	end,
}
