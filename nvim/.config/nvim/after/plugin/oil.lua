require("oil").setup({
  view_options = {
    show_hidden = true
  }
})

-- vim.keymap.set("n", "<leader>v", ":NvimTreeToggle<CR>", { silent = true, desc = "Nvimtree: Toggle" })
vim.keymap.set("n", "<leader>o", require("oil").open, { desc = "Open parent directory" })

