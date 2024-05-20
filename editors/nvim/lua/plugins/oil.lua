return {
  "stevearc/oil.nvim",
  config = function()
    require("oil").setup({
      columns = { "icon" },
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["<C-h>"] = false,
        ["q"] = "actions.close",
      },
    })

    vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { silent = true, desc = "Open parent directory" })
    vim.keymap.set(
      "n",
      "<leader>-",
      require("oil").toggle_float,
      { silent = true, desc = "Open parent directory in floating window" }
    )
  end,
}
