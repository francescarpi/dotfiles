local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

return {
  "numToStr/Navigator.nvim",
  config = function()
    require("Navigator").setup({})

    map("n", "<C-h>", "<CMD>NavigatorLeft<CR>")
    map("n", "<C-l>", "<CMD>NavigatorRight<CR>")
    map("n", "<C-k>", "<CMD>NavigatorUp<CR>")
    map("n", "<C-j>", "<CMD>NavigatorDown<CR>")
    map("n", "<C-p>", "<CMD>NavigatorPrevious<CR>")
  end,
}
