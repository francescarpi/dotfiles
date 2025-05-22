return {
  {
    "github/copilot.vim",
    opts = {},
    dependencies = {
    },
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.keymap.set("i", "<c-j>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
    end,
  },
}
