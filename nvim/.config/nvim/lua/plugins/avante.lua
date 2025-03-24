return {
  {
    "github/copilot.vim",
    opts = {},
    config = function()
      require("copilot").setup()
      vim.g.copilot_no_tab_map = true
      vim.keymap.set("i", "<c-j>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
    end,
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    opts = {
      provider = "copilot",
    },
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "MunifTanjim/nui.nvim",
      "zbirenbaum/copilot.lua",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante", "telekasten" },
        },
        ft = { "markdown", "Avante", "telekasten" },
      },
    },
  },
}
