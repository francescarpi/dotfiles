return {
	"tanvirtin/monokai.nvim",
	priority = 1000,
	config = function()
		require("monokai").setup({
			custom_hlgroups = {
				TabLineSel = {
					bg = "#ff0000",
				},
        CursorLineNr = {
          fg = "#ff0000"
        }
			},
		})
	end,
}
