vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("treesitter-folds", { clear = true }),
  callback = function()
    vim.wo[0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo[0].foldmethod = "expr"
    vim.wo[0].foldenable = false
  end,
})
