local adapter = "copilot"
-- local adapter = "lmstudio"

return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
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
        chat = {
          adapter = adapter,
          opts = {
            completion_provider = "blink",
          },
        },
        inline = {
          adapter = adapter,
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
