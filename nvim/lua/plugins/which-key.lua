return {
	-- https://github.com/folke/which-key.nvim
	"folke/which-key.nvim",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		local wk = require("which-key")
		local telescope = require("telescope.builtin")
		local theme = require("telescope.themes").get_ivy()

		-- Function keys
		wk.add({
			{ "<F1>", "<cmd>Neotree toggle=true<cr>" },
			{ "<F2>", "<cmd>SymbolsOutline<cr>" },
		}, {})

		-- Nav
		-- wk.register({
		-- "]]", "[[", navigate Python blocks (functions, method, class)
		-- "[c", "]c", navigate to GIT changes in the file
		-- }, {})

		-- Global
		wk.add({
			{
				"<leader>f",
				function()
					telescope.find_files(theme)
				end,
				desc = "Find files",
			},
			{
				"<leader>b",
				function()
					telescope.buffers(theme)
				end,
				desc = "Find files in buffer",
			},
			{
				"<leader>a",
				function()
					telescope.live_grep(theme)
				end,
				desc = "Search...",
			},
			{
				"<leader>A",
				function()
					telescope.grep_string(theme)
				end,
				desc = "Search word under the cursor",
			},
			{
				"<leader>s",
				"<cmd>SearchSession<cr>",
				desc = "Search session",
			},
			{
				"<leader>gh",
				function()
					telescope.help_tags(theme)
				end,
				desc = "Search all help tags",
			},
			{
				"<leader>gb",
				"<cmd>Git blame<cr>",
				desc = "Git blame",
			},
		}, {})

		-- Task runner and tests
		wk.add({
			{
				"<leader>tl",
				"<cmd>TestNearest<cr>",
				desc = "Run test nearby",
			},
			{
				"<leader>tf",
				"<cmd>TestFile<cr>",
				desc = "Run test file",
			},
			-- cb = { ":call VimuxRunCommand('cargo build')<CR>", "Cargo build" },
		}, {})

		-- LSP
		wk.add({
			{
				"<leader>gd",
				"<cmd>lua vim.lsp.buf.definition()<cr>",
				desc = "LSP definition",
			},
			{
				"<leader>gr",
				"<cmd>Trouble lsp_references<cr>",
				desc = "LSP reference",
			},
			{
				"<leader>gR",
				"<cmd>lua vim.lsp.buf.rename()<cr>",
				desc = "LSP rename",
			},
			{
				"<leader>ga",
				"<cmd>lua vim.lsp.buf.code_action()<cr>",
				desc = "LSP code action",
			},
			{
				"<leader>[g",
				"<cmd>lua vim.diagnostic.goto_next()<cr>",
				desc = "LSP diagnostic next",
			},
			{
				"<leader>]g",
				"<cmd>lua vim.diagnostic.goto_next()<cr>",
				desc = "LSP diagnostic prev",
			},
			{
				"<leader>gl",
				"<cmd>Trouble workspace_diagnostics<cr>",
				desc = "LSP show diagnostic list",
			},
		}, {})

		-- DAP
		wk.add({
			{ -- 1. Add breakpoint
				"<leader>dd",
				"<cmd>lua require('dap').toggle_breakpoint()<cr>",
				desc = "Toggle breakpoint",
			},
			{ -- 2. Start debugging
				"<leader>ds",
				"<cmd>lua require('dap').conitnue()<cr>",
				desc = "Start/Continue",
			},
			{ -- REPL
				"<leader>dr",
				"<cmd>lua require('dap').repl.open()<cr>",
				desc = "Open REPL",
			},
			{ -- Continue
				"<leader>dc",
				"<cmd>lua require('dap').continue()<cr>",
				desc = "Continue",
			},
			{ -- Step in
				"<leader>di",
				"<cmd>lua require('dap').step_into()<cr>",
				desc = "Step in",
			},
			{ -- Step out
				"<leader>do",
				"<cmd>lua require('dap').step_out()<cr>",
				desc = "Step out",
			},
			{ -- Step next
				"<leader>dn",
				"<cmd>lua require('dap').step_over()<cr>",
				desc = "Step next",
			},
		}, {})
	end,
}
