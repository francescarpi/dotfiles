local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    map("n", "<leader><tab>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { silent = true, desc = "Harpoon: Toggle quick menu" })

    map("n", "<leader>a", function()
      harpoon:list():add()
    end, { silent = true, desc = "Harpoon: Add file" })

    map("n", "<C-S-I>", function()
      harpoon:list():prev()
    end, { silent = true, desc = "Harpoon: Jump to previous" })

    map("n", "<C-S-O>", function()
      harpoon:list():next()
    end, { silent = true, desc = "Harpoon: Jump to next" })

    for i = 1, 5, 1 do
      map("n", "<C-" .. i .. ">", function()
        harpoon:list():select(i)
      end, { silent = true, desc = "Harpoon: Jump to file with index " .. i })
    end
  end,
}
