return {
  "stevearc/oil.nvim",
  config = function()
    require("oil").setup()
    vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { silent = true, desc = "Oil" })
  end,
}
