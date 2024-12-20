return {
  {
    {
      "milanglacier/minuet-ai.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      config = function()
        require("minuet").setup({
          provider = "openai_compatible",
          provider_options = {
            openai_compatible = {
              model = "codellama",
              end_point = "http://localhost:11434/v1/chat/completions",
              api_key = "PATH",
              name = "Llama3",
              stream = true,
            },
          },
          virtualtext = {
            auto_trigger_ft = {
              "lua",
            },
            keymap = {
              accept = "<A-A>",
              accept_line = "<A-a>",
              prev = "<A-[>",
              next = "<A-]>",
              dismiss = "<A-e>",
            },
          },
        })
      end,
    },
  },
}
