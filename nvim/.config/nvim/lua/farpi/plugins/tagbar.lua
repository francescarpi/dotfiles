return {
  'preservim/tagbar',
  config = function()
    vim.keymap.set("n", "<leader>t", ":TagbarToggle<CR>", { silent = true, desc = "Toggle Tagbar" })
  end
}
