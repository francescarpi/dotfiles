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
			"<leader><tab>",
			"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
			{ silent = true, desc = "Harpoon: Toggle quick menu" }
		)
		vim.keymap.set(
			"n",
			"<leader>1",
			"<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
			{ silent = true, desc = "Harpoon: Goto file 1" }
		)
		vim.keymap.set(
			"n",
			"<leader>2",
			"<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
			{ silent = true, desc = "Harpoon: Goto file 2" }
		)
		vim.keymap.set(
			"n",
			"<leader>3",
			"<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
			{ silent = true, desc = "Harpoon: Goto file 3" }
		)
		vim.keymap.set(
			"n",
			"<leader>4",
			"<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
			{ silent = true, desc = "Harpoon: Goto file 4" }
		)
		vim.keymap.set(
			"n",
			"<leader>5",
			"<cmd>lua require('harpoon.ui').nav_file(5)<cr>",
			{ silent = true, desc = "Harpoon: Goto file 5" }
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
