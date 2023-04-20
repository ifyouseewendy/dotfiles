return {
	"simrat39/symbols-outline.nvim",
	config = function()
		local opts = {
			keymaps = { -- These keymaps can be a string or a table for multiple keys
				close = { "<Esc>", "q" },
				goto_location = "<Cr>",
				focus_location = "o",
				hover_symbol = "<C-space>",
				toggle_preview = "K",
				rename_symbol = "r",
				code_actions = "a",
				fold = "x",
				unfold = "f",
				fold_all = "X",
				unfold_all = "F",
				fold_reset = "R",
			},
		}
		require("symbols-outline").setup(opts)
	end,
}
