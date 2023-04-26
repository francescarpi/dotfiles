vim.keymap.set("n", "<leader>gg", ":tab G<CR>", { silent = true, desc = "Toggle Neogit" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "fugitive",
  callback = function(args)
    vim.keymap.set("n", "q", ":q<CR>", { silent = true, desc = "Quit from fugitive" })
  end
})
