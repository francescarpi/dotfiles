return {
  "numToStr/Navigator.nvim",
  config = function()
    require("Navigator").setup({})

    vim.keymap.set("n", "<C-S-h>", "<CMD>NavigatorLeft<CR>")
    vim.keymap.set("n", "<C-S-l>", "<CMD>NavigatorRight<CR>")
    vim.keymap.set("n", "<C-S-k>", "<CMD>NavigatorUp<CR>")
    vim.keymap.set("n", "<C-S-j>", "<CMD>NavigatorDown<CR>")
  end,
}
