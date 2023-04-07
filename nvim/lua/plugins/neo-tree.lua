return {
	-- https://github.com/nvim-neo-tree/neo-tree.nvim/
	"nvim-neo-tree/neo-tree.nvim",
	event = { "VimEnter" },
	branch = "v2.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
		require("neo-tree").setup({
			close_if_last_window = true,
			window = {
				mappings = {
					["x"] = {
						"toggle_node",
						nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
					},
					["o"] = "open",
					["H"] = "prev_source",
					["L"] = "next_source",
					["i"] = "open_split",
				},
			},
			filesystem = {
				follow_current_file = true,
			},
		})
	end,
}
