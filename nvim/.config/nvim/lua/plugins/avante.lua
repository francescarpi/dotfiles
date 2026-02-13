return {
  {
    "yetone/avante.nvim",
    build = "make",
    event = "VeryLazy",
    version = false,
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      -- add any opts here
      -- this file can contain specific instructions for your project
      instructions_file = "avante.md",
      provider = "openai",
      providers = {
        -- lmstudio = {
        --   __inherited_from = "ollama",
        --   endpoint = "http://127.0.0.1:1234/api/v1",
        --   model = "google/gemma-3-4b",
        -- },
        openai = {
          endpoint = "http://127.0.0.1:1234/v1",
          model = "google/gemma-3-4b",
          api_key_name = "lmstudio_api_key",
          extra_request_body = {
            max_tokens = 4096,
          },
        },
        -- ollama = {
        --   model = "google/gemma-3-4b",
        --   endpoint = "http://127.0.0.1:1234",
        --   -- is_env_set = require("avante.providers.ollama").check_endpoint_alive,
        -- },
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
