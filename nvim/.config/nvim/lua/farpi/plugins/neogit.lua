return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'rcarriga/nvim-notify'
  },
  config = function()
    local neogit = require('neogit')

    neogit.setup {
      disable_commit_confirmation = true,
      integrations = {
        diffview = true,
        telescope = true
      }
    }

    vim.keymap.set("n", "<leader>g", function() neogit.open() end, { silent = true, desc = "Toggle neogit" })
  end
}
