local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

return {
  "stevearc/oil.nvim",
  config = function()
    local oil = require("oil")
    oil.setup({
      view_options = {
        show_hidden = true,
      },
    })

    map("n", "<leader>o", oil.open, { desc = "Open parent directory" })
  end,
}
