vim.keymap.set("n", "<leader>gg", ":G | only<CR>", { silent = true, desc = "Toggle git" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "fugitive",
  callback = function(args)
    vim.keymap.set("n", "q", ":bdelete<CR>", { silent = true, desc = "Quit from fugitive" })
  end
})
