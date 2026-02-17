return {
  {
    "yetone/avante.nvim",
    -- dir = "~/dev/avante.nvim",
    build = "make",
    event = "VeryLazy",
    version = false,
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      -- add any opts here
      -- this file can contain specific instructions for your project
      -- instructions_file = "avante.md",
      -- provider = "copilot",
      provider = "qianwen",
      providers = {
        qianwen = {
          __inherited_from = "openai",
          api_key_name = "LMSTUDIO_API_KEY",
          endpoint = "http://127.0.0.1:1234/v1",
          model = "qwen/qwen3-coder-30b",
          disable_tools = true,
          -- extra_request_body = {
          --   temperature = 1,
          --   -- max_tokens = 4096,
          -- },
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
