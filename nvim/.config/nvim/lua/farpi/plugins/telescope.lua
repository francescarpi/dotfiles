return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",  -- brew install rg
		"nvim-telescope/telescope-live-grep-args.nvim",
	},
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = {
					".git",
					"node_modules",
					".venv",
					"img",
					"fonts",
					"images",
          ".mypy_cache",
          "__pycache__",
				},
				mappings = {
					i = {
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
					},
				},
			},
			pickers = {
				find_files = {
					theme = "dropdown",
					layout_config = {
						width = 0.9,
					},
				},
			},
			extensions = {
				"live_grep_args",
			},
		})

		vim.keymap.set(
			"n",
			"<leader>ff",
			"<cmd>lua require'telescope.builtin'.find_files{hidden = true}<CR>",
			{ silent = true, desc = "Telescope: files" }
		)
		vim.keymap.set(
			"n",
			"<leader>ft",
			"<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>",
			{ silent = true, desc = "Telescope: tags" }
		)
		vim.keymap.set(
			"n",
			"<leader>fs",
			":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
			{ silent = true, desc = "Telescope: grep" }
		)
		vim.keymap.set(
			"n",
			"<leader>fb",
			"<cmd>lua require'telescope.builtin'.buffers{}<CR>",
			{ silent = true, desc = "Telescope: buffers" }
		)
		vim.keymap.set(
			"n",
			"<leader>fd",
			"<cmd>lua require'telescope.builtin'.diagnostics{}<CR>",
			{ silent = true, desc = "Telescope: diagnostics" }
		)
		vim.keymap.set(
			"n",
			"<leader>fk",
			"<cmd>lua require'telescope.builtin'.keymaps{}<CR>",
			{ silent = true, desc = "Telescope: keymaps" }
		)
		vim.keymap.set(
			"n",
			"<leader>fg",
			"<cmd>lua require'telescope.builtin'.git_status{}<CR>",
			{ silent = true, desc = "Telescope: git_status" }
		)
		vim.keymap.set(
			"n",
			"<leader>fm",
			"<cmd>lua require'telescope.builtin'.marks{}<CR>",
			{ silent = true, desc = "Telescope: marks" }
		)
	end,
}
