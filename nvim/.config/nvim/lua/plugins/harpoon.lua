local selection_chars = "qwertzxcv"

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    vim.keymap.set("n", ";;", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { silent = true, desc = "Harpoon: Toggle quick menu" })

    vim.keymap.set("n", ";a", function()
      print("File appended")
      harpoon:list():add()
    end, { silent = true, desc = "Harpoon: Append file" })

    vim.keymap.set("n", "<S-h>", function()
      harpoon:list():prev()
    end, { silent = true, desc = "Harpoon: Previous file" })

    vim.keymap.set("n", "<S-l>", function()
      harpoon:list():next()
    end, { silent = true, desc = "Harpoon: Next file" })

    for i = 1, #selection_chars do
      local char = selection_chars:sub(i, i)
      vim.keymap.set("n", ";" .. char, function()
        harpoon:list():select(i)
      end, { silent = true, desc = "Harpoon: File " .. i })
    end
  end,
}
