return {
  {
    "saghen/blink.cmp",
    version = "v0.*",
    opts = {
      keymap = { preset = "default" },
      enabled = function()
        local filetype = vim.bo.filetype
        if filetype == "minifiles" then
          return false
        end
        return true
      end,
      completion = {
        accept = {
          auto_brackets = {
            enabled = false,
          },
        },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      signature = { enabled = true },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
          codecompanion = { "codecompanion" },
        }
      },
    },
  },
}
