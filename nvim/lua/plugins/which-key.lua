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
		wk.register({
			["<F1>"] = { ":Neotree toggle=true<cr>", "Show Neotree" },
		}, {})

		-- Nav
		wk.register({
			-- "]]", "[[", navigate Python blocks (functions, method, class)
			-- "[c", "]c", navigate to GIT changes in the file
		}, {})

		-- Global
		wk.register({
			f = {
				function()
					telescope.find_files(theme)
				end,
				"Find files",
			},
			b = {
				function()
					telescope.buffers(theme)
				end,
				"Find files in buffer",
			},
			a = {
				function()
					telescope.live_grep(theme)
				end,
				"Search...",
			},
			A = {
				function()
					telescope.grep_string(theme)
				end,
				"Search word under the cursor",
			},
			s = {
				":SearchSession<cr>",
				"Search session",
			},
			gh = {
				function()
					telescope.help_tags(theme)
				end,
				"Search all help tags",
			},
			gb = { ":Git blame<cr>", "Git blame" },
		}, { prefix = "<leader>" })

		-- Task runner and tests
		wk.register({
			tl = { ":TestNearest<cr>", "Run test nearby" },
			tf = { ":TestNearest<cr>", "Run test file" },
			-- cb = { ":call VimuxRunCommand('cargo build')<CR>", "Cargo build" },
		}, { prefix = "<leader>" })

		-- LSP
		wk.register({
			gd = { ":lua vim.lsp.buf.definition()<cr>", "LSP definition" },
			gr = { ":Trouble lsp_references<cr>", "LSP reference" },
			gR = { ":lua vim.lsp.buf.rename()<cr>", "LSP rename" },
			ga = { ":lua vim.lsp.buf.code_action()<cr>", "LSP code action" },
			["[g"] = { ":lua vim.diagnostic.goto_next()<cr>", "LSP diagnostic next" },
			["]g"] = { ":lua vim.diagnostic.goto_next()<cr>", "LSP diagnostic prev" },
			gl = {
				":Trouble workspace_diagnostics<cr>",
				"LSP show diagnostic list",
			},
		}, { prefix = "<leader>" })

		-- DAP
		wk.register({
			dd = { ":lua require('dap').toggle_breakpoint()<cr>", "" }, -- 1. Add breakpoint
			ds = { ":lua require('dap').conitnue()<cr>", "" }, -- 2. Start debugging
			dr = { ":lua require('dap').repl.open()<cr>", "" }, -- REPL
			dc = { ":lua require('dap').continue()<cr>", "" }, -- Continue
			di = { ":lua require('dap').step_into()<cr>", "" }, -- Step in
			["do"] = { ":lua require('dap').step_out()<cr>", "" }, -- Step out
			dn = { ":lua require('dap').step_over()<cr>", "" }, -- Step next
		}, { prefix = "<leader>" })
	end,
}
