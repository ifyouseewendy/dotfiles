return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("ibl").setup({ indent = { char = "|" } })
	end,
}
