return {
  "stevearc/oil.nvim",
  config = function()
    require("oil").setup()
    vim.keymap.set("n", "<Leader><tab>", function()
      require("oil").toggle_float()
    end)
  end,
}
