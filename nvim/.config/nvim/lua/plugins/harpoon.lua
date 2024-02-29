local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

return {
  "ThePrimeagen/harpoon",
  config = function()
    require("harpoon").setup({
      menu = {
        width = vim.api.nvim_win_get_width(0) - 100,
      },
    })
    map(
      "n",
      "<leader>a",
      "<cmd>lua require('harpoon.mark').add_file()<cr>",
      { silent = true, desc = "Harpoon: Add file" }
    )
    map(
      "n",
      "<leader><tab>",
      "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
      { silent = true, desc = "Harpoon: Toggle quick menu" }
    )
    map(
      "n",
      "<leader>1",
      "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
      { silent = true, desc = "Harpoon: Goto file 1" }
    )
    map(
      "n",
      "<leader>2",
      "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
      { silent = true, desc = "Harpoon: Goto file 2" }
    )
    map(
      "n",
      "<leader>3",
      "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
      { silent = true, desc = "Harpoon: Goto file 3" }
    )
    map(
      "n",
      "<leader>4",
      "<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
      { silent = true, desc = "Harpoon: Goto file 4" }
    )
    map(
      "n",
      "<leader>5",
      "<cmd>lua require('harpoon.ui').nav_file(5)<cr>",
      { silent = true, desc = "Harpoon: Goto file 5" }
    )

    require("telescope").load_extension("harpoon")
    map("n", "<leader>fh", "<cmd>:Telescope harpoon marks<CR>", { silent = true, desc = "Telescope: harpoon" })
  end,
}
