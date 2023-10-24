return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true,
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>b", ":BufferLinePick<CR>", { silent = true, desc = "Bufferline: Pick" })
		vim.keymap.set("n", "<C-Right>", ":BufferLineCycleNext<CR>", { silent = true, desc = "Bufferline: Next" })
		vim.keymap.set("n", "<C-Left>", ":BufferLineCyclePrev<CR>", { silent = true, desc = "Bufferline: Previous" })
	end,
}
