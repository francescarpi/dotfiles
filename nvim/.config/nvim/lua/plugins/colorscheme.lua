local function apply_color(color)
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "MiniFilesBorder", { fg = "#ffffff" })
end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {},
    config = function()
      require("catppuccin").setup({
        show_end_of_buffer = true,
        transparent_background = true,
        integrations = {
          gitsigns = true,
          treesitter = true,
          harpoon = true,
        },
      })
      apply_color("catppuccin-mocha")
    end,
  },
}
