return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd([[colorscheme catppuccin-mocha]])
      vim.api.nvim_set_hl(0, "MiniFilesBorder", { fg = "#ffffff" })
    end,
  },
}
