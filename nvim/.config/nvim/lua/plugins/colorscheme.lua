function apply_color(color)
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

  vim.api.nvim_set_hl(0, "MiniFilesBorder", { fg = "#ffffff" })
end

return {
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     apply_color("catppuccin-mocha")
  --   end,
  -- },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        disable_background = true,
        styles = {
          italic = false,
        },
      })
      apply_color("rose-pine-moon")
    end,
  },
}
