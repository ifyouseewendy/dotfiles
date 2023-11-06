return {
	-- https://github.com/jose-elias-alvarez/null-ls.nvim
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			-- Use :NullLsLog to view logs
			debug = true,
			sources = {
				-- Python
				null_ls.builtins.diagnostics.ruff,
				null_ls.builtins.diagnostics.mypy,
				null_ls.builtins.formatting.ruff,
				-- null_ls.builtins.formatting.black.with({ extra_args = { "--verbose" } }),
				-- Lua
				-- Use extra_args = { "--indent-type", "Spaces" } to format with spaces
				null_ls.builtins.formatting.stylua,
			},
			-- Formatting on save
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})
	end,
}
