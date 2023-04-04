return {
	"vim-test/vim-test",
	dependencies = { "preservim/vimux" },
	config = function()
		vim.cmd([[let test#strategy = "vimux"]])

		vim.cmd([[let test#python#runner = 'pytest']])

		vim.cmd([[let test#javascript#jest#options = { 'suite': '--bail' }]])
	end,
}
