return {
	"vim-test/vim-test",
	dependencies = { "preservim/vimux" },
	config = function()
		vim.cmd([[let test#strategy = "vimux"]])

		vim.cmd([[let test#python#runner = 'pytest']])

		vim.cmd([[nmap <silent> <leader>tl :TestNearest<CR>]])
		vim.cmd([[nmap <silent> <leader>ts :TestSuite<CR>]])
		vim.cmd([[nmap <silent> <leader>tf :TestFile<CR>]])
		vim.cmd([[nmap <silent> <leader>tg :TestVisit<CR>]])

		vim.cmd([[nmap <silent> <leader>cb :call VimuxRunCommand("cargo build")<CR>]])
		vim.cmd([[nmap <silent> <leader>cc :call VimuxRunCommand("cargo check")<CR>]])
		vim.cmd([[nmap <silent> <leader>cr :call VimuxRunCommand("cargo run")<CR>]])

		vim.cmd([[let test#javascript#jest#options = { 'suite': '--bail' }]])
	end,
}
