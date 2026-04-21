-- File to enable plugins using the native nvim package manager

require("lazyload").on_vim_enter(function()
  -- UndoTree
  vim.cmd("packadd nvim.undotree")
  vim.keymap.set("n", "<leader>u", require("undotree").open)

  -- DiffTool
  vim.cmd("packadd nvim.difftool")
end)
