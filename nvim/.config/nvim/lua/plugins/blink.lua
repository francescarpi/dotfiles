return {
  {
    "saghen/blink.cmp",
    version = "v0.*",

    opts = {
      keymap = { preset = "super-tab" },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      signature = { enabled = true },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {},
      },
    },
  },
}
