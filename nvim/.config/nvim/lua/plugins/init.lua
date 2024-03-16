return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
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
    config = function ()
      require("Navigator").setup({})
    end
  }
}
