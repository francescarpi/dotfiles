local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

return {
  "numToStr/Navigator.nvim",
  config = function()
    require("Navigator").setup({})

    map("n", "<C-S-h>", "<CMD>NavigatorLeft<CR>")
    map("n", "<C-S-l>", "<CMD>NavigatorRight<CR>")
    map("n", "<C-S-k>", "<CMD>NavigatorUp<CR>")
    map("n", "<C-S-j>", "<CMD>NavigatorDown<CR>")
  end,
}
