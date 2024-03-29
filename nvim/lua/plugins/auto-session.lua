return {
	-- https://github.com/rmagatti/auto-session
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup({
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Workspace", "~/Downloads", "/" },
		})
		vim.o.sessionoptions = "blank,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
	end,
}
