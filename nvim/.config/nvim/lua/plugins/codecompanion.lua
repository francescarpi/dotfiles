return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      {
        "<leader>ac",
        ":CodeCompanionChat Toggle<cr>",
        mode = "",
        desc = "Open code companion chat buffer",
      },
      {
        "<leader>ai",
        ":CodeCompanion<cr>",
        mode = "",
        desc = "Open code companion inline assistant",
      },
      {
        "<leader>aa",
        ":CodeCompanionActions<cr>",
        mode = "",
        desc = "Open code companion actions",
      },
    },
    opts = {
      interactions = {
        chat = { adapter = "lmstudio" },
        inline = {
          adapter = "lmstudio",
        },
      },
      adapters = {
        http = {
          lmstudio = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                url = "http://localhost:1234",
              },
            })
          end,
        },
      },
    },
  },
}
