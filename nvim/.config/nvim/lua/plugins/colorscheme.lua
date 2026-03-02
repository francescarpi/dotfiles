return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {},
    config = function()
      require("catppuccin").setup({
        show_end_of_buffer = true,
        transparent_background = false,
        integrations = {
          gitsigns = true,
          treesitter = true,
          harpoon = true,
          buffon = true,
        },
      })
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
}
