return {
  {
    "olimorris/codecompanion.nvim",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      {
        "<leader>a",
        ":CodeCompanionChat toggle<CR>",
        mode = "",
        desc = "[F]ormat buffer",
        silent = true,
      },
    },
  },
}
