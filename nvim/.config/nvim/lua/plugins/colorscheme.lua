return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {},
    config = function()
      require("catppuccin").setup({
        show_end_of_buffer = true,
        transparent_background = true,
        integrations = {
          gitsigns = true,
          harpoon = true,
          buffon = true,
        },
      })
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
}
