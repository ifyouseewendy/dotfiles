return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("trouble").setup({
			action_keys = {
				open_split = { "<c-s>" },
			},
		})
	end,
}
