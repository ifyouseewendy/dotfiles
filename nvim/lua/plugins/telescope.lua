return {
	-- https://github.com/nvim-telescope/telescope.nvim
	--
	-- Ohter usage:
	--
	-- * <C-x> open file as a split
	-- * <C-v> open file as a vsplit
	-- * <C-t> open file in a tab
	-- * <C-Q> send all items to quickfix
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		-- There is no auto bulding. You have to call build manually.
		-- In addition, lazy would not automatically build again if the plugin is already installed or not updated,
		-- so to re-build, delete the folder ~/.local/share/nvim/lazy/
		-- https://github.com/nvim-telescope/telescope-fzf-native.nvim/issues/96
		-- :Lazy build telescope-fzf-native.nvim
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = false },
	},
	config = function()
		-- Use <c-T> to open Telescope results in Trouble
		-- https://github.com/folke/trouble.nvim
		local actions = require("telescope.actions")
		local trouble = require("trouble.providers.telescope")

		require("telescope").setup({
			-- Use <c-T> to open Telescope results in Trouble
			defaults = {
				mappings = {
					i = {
						["<C-t>"] = trouble.open_with_trouble,
						["<C-h>"] = "which_key",
						["<C-s>"] = actions.select_horizontal,
					},
					n = { ["<C-t>"] = trouble.open_with_trouble },
				},
			},
			extensions = {
				-- telescope-fzf-native.nvim
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		})

		-- telescope-fzf-native.nvim
		-- To get fzf loaded and working with telescope, you need to call
		-- load_extension, somewhere after setup function:
		require("telescope").load_extension("fzf")
	end,
}
