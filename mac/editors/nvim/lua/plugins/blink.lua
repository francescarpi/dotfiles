return {
  "saghen/blink.cmp",
  event = { "LspAttach" },
  version = "v0.*",
  opts = {
    keymap = { preset = "super-tab" },
    highlight = {
      use_nvim_cmp_as_default = true,
    },
    nerd_font_variant = "mono",
    accept = { auto_brackets = { enabled = true } },
  },
  opts_extend = { "sources.completion.enabled_providers" },
}
