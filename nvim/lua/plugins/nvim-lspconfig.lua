return {
	"neovim/nvim-lspconfig",
	dependencies = { "hrsh7th/nvim-cmp" },
	config = function()
		-- Setup language servers.
		local lspconfig = require("lspconfig")

		-- Hook nvim-cmp
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Specify a virtual env for Pyright
		-- https://github.com/neovim/nvim-lspconfig/issues/500#issuecomment-876700701
		local util = require("lspconfig/util")
		local path = util.path
		local function get_python_path(workspace)
			-- Use activated virtualenv.
			if vim.env.VIRTUAL_ENV then
				return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
			end

			-- Find and use virtualenv via poetry in workspace directory.
			local match = vim.fn.glob(path.join(workspace, "poetry.lock"))
			if match ~= "" then
				local venv = vim.fn.trim(vim.fn.system("poetry env info -p"))
				return path.join(venv, "bin", "python")
			end

			-- Fallback to system Python.
			return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
		end

		-- Set up lspconfig for pyright
		lspconfig.pyright.setup({
			on_init = function(client)
				client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
			end,
			capabilities = capabilities,
			python = {
				analysis = {
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					useLibraryCodeForTypes = true,
				},
			},
		})

		-- Show diagnostic source
		vim.diagnostic.config({ virtual_text = { source = true } })

		-- Set up lspconfig for typescript
		-- lspconfig.tsserver.setup({})
		require("lspconfig").eslint.setup({
			root_dir = lspconfig.util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git"),
		})
	end,
}
