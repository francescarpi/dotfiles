return {
	"preservim/nerdtree",
	config = function()
		vim.keymap.set("n", "<leader><leader>", ":NERDTreeToggle<CR>", { silent = true, desc = "NERDTree: Toggle" })
	end,
}
