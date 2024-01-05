return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			hijack_cursor = false,
			update_focused_file = {
				enable = true,
			},
      view = {
        adaptive_size = false
      },
			filters = {
				dotfiles = true,
			},
      renderer = {
        indent_markers = {
          enable = true
        }
      }
		})

		vim.keymap.set("n", "<leader>v", ":NvimTreeToggle<CR>", { silent = true, desc = "Nvimtree: Toggle" })
	end,
}
