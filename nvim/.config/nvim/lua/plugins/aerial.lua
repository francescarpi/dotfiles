return {
  {
    'stevearc/aerial.nvim',
    keys = {
      {
        "<leader>r",
        "<cmd>AerialToggle!<CR>",
        desc = "Toggle Aerial",
      },
    },
    opts = {
      layout = {
        default_direction = "prefer_left",
      }
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  }
}
