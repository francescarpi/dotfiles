return {
  {
    "saghen/blink.cmp",
    version = "v0.*",
    dependencies = {
      "Kaiser-Yang/blink-cmp-avante",
    },
    opts = {
      keymap = { preset = "default" },
      completion = {
        accept = {
          auto_brackets = {
            enabled = false
          }
        }
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      signature = { enabled = true },
      sources = {
        default = { "avante", "lsp", "path", "snippets", "buffer" },
        per_filetype = {
          ["copilot-chat"] = {},
        },
        providers = {
          avante = {
            module = 'blink-cmp-avante',
            name = 'Avante',
            opts = {
            }
          }
        }
      },
    },
  },
}
