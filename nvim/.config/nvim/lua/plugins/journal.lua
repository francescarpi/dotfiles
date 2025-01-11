return {
  {
    "jakobkhansen/journal.nvim",
    config = function()
      require("journal").setup({
        root = "~/.journal",
      })
      vim.keymap.set("n", "<leader>j", "<cmd>Journal<cr>", { silent = true, desc = "Journal: Open" })
    end,
  },
}
