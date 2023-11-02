return {
	"ThePrimeagen/harpoon",
	config = function()
		vim.keymap.set(
			"n",
			"<leader>ha",
			"<cmd>lua require('harpoon.mark').add_file()<cr>",
			{ silent = true, desc = "Harpoon: Add file" }
		)
		vim.keymap.set(
			"n",
			"<leader>h1",
			"<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
			{ silent = true, desc = "Harpoon: Goto file 1" }
		)
		vim.keymap.set(
			"n",
			"<leader>h2",
			"<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
			{ silent = true, desc = "Harpoon: Goto file 2" }
		)
		vim.keymap.set(
			"n",
			"<leader>h3",
			"<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
			{ silent = true, desc = "Harpoon: Goto file 3" }
		)
		vim.keymap.set(
			"n",
			"<leader>h4",
			"<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
			{ silent = true, desc = "Harpoon: Goto file 4" }
		)

		require("telescope").load_extension("harpoon")
		vim.keymap.set(
			"n",
			"<leader>fh",
			"<cmd>:Telescope harpoon marks<CR>",
			{ silent = true, desc = "Telescope: harpoon" }
		)
	end,
}
