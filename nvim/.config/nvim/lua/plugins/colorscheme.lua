return {
  {
    "catppuccin/nvim",
    -- dir = "/Users/farpi/dev/neovim/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {},
    config = function()
      require("catppuccin").setup({
        show_end_of_buffer = true,
        transparent_background = true,
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
