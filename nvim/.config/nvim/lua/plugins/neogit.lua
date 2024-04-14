local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",  -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua",              -- optional
  },
  config = function()
    local neogit = require('neogit')
    neogit.setup {}

    map("n", "<leader>g", function()
      neogit.open()
    end, { silent = true, desc = "Neogit: open" })
  end
}
