return {
  {
    "renerocksai/telekasten.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-telekasten/calendar-vim",
    },
    config = function()
      require("telekasten").setup({
        home = vim.fn.expand("~/.telekasten"),
      })
      vim.keymap.set(
        "n",
        "<leader>j",
        "<cmd>Telekasten goto_today<cr>",
        { silent = true, desc = "Telekasten: Goto today" }
      )
      vim.keymap.set("n", "<leader>jj", "<cmd>Telekasten panel<cr>", { silent = true, desc = "Telekasten: Panel" })
      vim.keymap.set(
        "n",
        "<leader>jt",
        "<cmd>Telekasten toggle_todo<cr>",
        { silent = true, desc = "Telekasten: Toggle Todo" }
      )
      vim.api.nvim_set_hl(0, "tkTag", { fg = "gray" })
    end,
  },
}
