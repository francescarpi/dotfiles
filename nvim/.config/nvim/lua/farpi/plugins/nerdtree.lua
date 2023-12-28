return {
	"preservim/nerdtree",
	config = function()
		vim.keymap.set("n", "<leader><leader>", ":NERDTreeFind<CR>", { silent = true, desc = "NERDTree: Toggle" })
	end,
}
