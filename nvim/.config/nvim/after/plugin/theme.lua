require("catppuccin").setup({
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    notify = true,
    neogit = true,
  }
})

vim.cmd.colorscheme "catppuccin-mocha"

