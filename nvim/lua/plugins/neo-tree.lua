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
						"close_node",
					},
					["o"] = "open",
					["H"] = "prev_source",
					["L"] = "next_source",
					["i"] = "open_split",
					["s"] = "open_vsplit",
					["Y"] = "copy_to_clipboard",
					["X"] = "cut_to_clipboard",
					["P"] = "paste_from_clipboard",
				},
			},
			filesystem = {
				follow_current_file = true,
				filtered_items = {
					visible = true,
					hide_gitignored = false,
					hide_by_name = {
						".DS_Store",
						"thumbs.db",
						"node_modules",
					},
				},
			},
		})
	end,
}
