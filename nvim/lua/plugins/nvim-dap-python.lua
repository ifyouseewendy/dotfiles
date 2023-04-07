return {
	-- https://github.com/mfussenegger/nvim-dap-python
	--
	-- Config file at ~/.dotfiles/nvim/launch.json
	"mfussenegger/nvim-dap-python",
	dependencies = {
		"mfussenegger/nvim-dap",
		-- https://github.com/rcarriga/nvim-dap-ui
		{ "rcarriga/nvim-dap-ui", lazy = false },
	},
	config = function()
		require("dap-python").setup("~/Workspace/.virtualenvs/debugpy/bin/python")
		require("dap-python").test_runner = "pytest"
		require("dap.ext.vscode").load_launchjs("/Users/di/.dotfiles/nvim/launch.json")
		require("dapui").setup()

		-- Open nvim-dap-ui autoamtically
		local dap, dapui = require("dap"), require("dapui")
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,
}
