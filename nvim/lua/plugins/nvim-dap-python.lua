return {
	-- https://github.com/mfussenegger/nvim-dap-python
	--
	-- Config file at ~/.dotfiles/nvim/launch.json
	"mfussenegger/nvim-dap-python",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		require("dap-python").setup("~/Workspace/.virtualenvs/debugpy/bin/python")
		require("dap-python").test_runner = "pytest"
		require("dap.ext.vscode").load_launchjs("/Users/di/.dotfiles/nvim/launch.json")
	end,
}
