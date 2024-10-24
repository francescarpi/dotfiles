-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("BufLeave", {
  desc = "Save window view before leave",
  callback = function()
    vim.b.view = vim.fn.winsaveview()
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  desc = "Restore save view",
  callback = function()
    if vim.b.view then
      vim.fn.winrestview(vim.b.view)
      vim.b.view = nil
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<C-w><Enter><C-w>T", { noremap = true })
  end,
})
