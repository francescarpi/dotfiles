return {
	"tanvirtin/monokai.nvim",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("monokai")
		vim.cmd("highlight TabLineSel guibg=#ffaf26 guifg=#000000")
	end,
}
