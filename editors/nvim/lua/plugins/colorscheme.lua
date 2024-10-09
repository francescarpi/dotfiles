return {
  -- {
  --   "dasupradyumna/midnight.nvim",
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     vim.cmd([[colorscheme midnight]])
  --     vim.api.nvim_set_hl(0, "MiniFilesBorder", { fg = "#ffffff" })
  --   end,
  -- },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
      vim.api.nvim_set_hl(0, "MiniFilesBorder", { fg = "#ffffff" })
    end,
  },
}
