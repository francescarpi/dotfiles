return {
	"tanvirtin/monokai.nvim",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("monokai")
    vim.cmd("hi CursorLine guibg=#4d5154")
	end,
}
