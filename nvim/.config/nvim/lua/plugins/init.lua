return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			git = { enable = true },
		},
	},

	{
		"numToStr/Navigator.nvim",
    lazy = false,
		config = function()
			require("Navigator").setup({})
			vim.keymap.set({ "n", "t" }, "<C-S-h>", "<CMD>NavigatorLeft<CR>")
			vim.keymap.set({ "n", "t" }, "<C-S-l>", "<CMD>NavigatorRight<CR>")
			vim.keymap.set({ "n", "t" }, "<C-S-k>", "<CMD>NavigatorUp<CR>")
			vim.keymap.set({ "n", "t" }, "<C-S-j>", "<CMD>NavigatorDown<CR>")
		end,
	},
}
