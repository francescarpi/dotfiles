require('neogit').setup {
  disable_commit_confirmation = true,
  integrations = {
    diffview = true,
  },
}

-- vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", { silent = true, desc = "Toggle Neogit" })

