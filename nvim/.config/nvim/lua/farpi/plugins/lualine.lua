return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			theme = "catppuccin",
			options = {
				component_separators = " ",
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = { "NvimTree" },
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
