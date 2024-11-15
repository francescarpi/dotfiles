return {
  "mhinz/vim-grepper",
  config = function()
    vim.keymap.set("n", "<leader>gg", function()
      vim.cmd("Grepper")
    end, { silent = true })
    vim.g.grepper = {
      tools = { "rg", "git" },
    }
  end,
}
