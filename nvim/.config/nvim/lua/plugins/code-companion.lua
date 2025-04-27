return {
  {
    "olimorris/codecompanion.nvim",
    opts = {
      display = {
        diff = {
          enabled = true,
          close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
          layout = "vertical", -- vertical|horizontal split for default provider
          opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
          provider = "default", -- default|mini_diff
        },
        chat = {
          auto_scroll = false,
          start_in_insert_mode = false, -- Open the chat buffer in insert mode?
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      {
        "Davidyz/VectorCode",
        version = "*",
        dependencies = { "nvim-lua/plenary.nvim" },
        cmd = "VectorCode",
        build = "pipx upgrade vectorcode",
      },
      {
        "OXY2DEV/markview.nvim",
        lazy = false,
        opts = {
          preview = {
            filetypes = { "markdown", "codecompanion" },
            ignore_buftypes = {},
          },
        },
      },
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
