return {
	-- https://github.com/kshenoy/vim-signature
	--
	-- Tweak usage:
	--
	--   Add:
	--
	--     + Use mm to auto set next mark, or unset marks:w
	--     + Use ma, mb, mc to set mark manually
	--
	--   Del:
	--
	--     + Use m<Space> to unset all
	--     + Use mm to unset
	--
	--   Navi:
	--
	--     + Use mn to jump next, mp to jump prev
	--     + Use 'a, 'b, 'c to jump manually
	--
	--   Show:
	--
	--     + Use m/
	"kshenoy/vim-signature",
	config = function()
		vim.cmd([[let g:SignatureIncludeMarks = 'abcdefghijkloqrstuvwxyz']])
		vim.cmd([[let g:SignatureIncludeMarkers = '']])

		vim.cmd(
			[[let g:SignatureMap = { 'ToggleMarkAtLine':"mm", 'DeleteMark':"dm", 'PurgeMarks':"m<Space>", 'GotoNextSpotAlpha':"mn", 'GotoPrevSpotAlpha':"mp", 'ListBufferMarks':"m/", }]]
		)
	end,
}
