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
        integrations = {
          cmp = true,
          gitsigns = true,
          treesitter = true,
          harpoon = true,
          neogit = true,
          copilot_vim = true,
        },
      })
      apply_color("catppuccin-mocha")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        integrations = {
          cmp = true,
          gitsigns = true,
          treesitter = true,
          harpoon = true,
          neogit = true,
          copilot_vim = true,
        },
        disable_background = true,
        styles = {
          italic = false,
        },
      })
      -- apply_color("rose-pine-moon")
    end,
  },
}
