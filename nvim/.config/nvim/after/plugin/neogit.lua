local neogit = require('neogit')
neogit.setup {
  disable_commit_confirmation = true,
  disable_hint = true,
  integrations = {
    diffview = true
  }
}

vim.keymap.set("n", "<leader>g", function() neogit.open() end, { silent = true, desc = "Toggle neogit" })
