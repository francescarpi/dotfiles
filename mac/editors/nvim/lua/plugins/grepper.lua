return {
  "mhinz/vim-grepper",
  config = function()
    vim.keymap.set("n", "<Leader>gg", function()
      vim.cmd("Grepper")
    end, { silent = true })
    vim.g.grepper = {
      tools = { "rg", "git" },
    }
    vim.keymap.set({ "n", "x" }, "gs", "<plug>(GrepperOperator)")
  end,
}
