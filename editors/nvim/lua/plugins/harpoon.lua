return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    vim.keymap.set("n", "<leader>q", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { silent = true, desc = "Harpoon: Toggle quick menu" })

    vim.keymap.set("n", "<leader>a", function()
      print("File added to Harpoon list")
      harpoon:list():add()
    end, { silent = true, desc = "Harpoon: Add file" })

    vim.keymap.set("n", "<C-h>", function()
      harpoon:list():select(1)
    end, { silent = true, desc = "Harpoon: File 1" })
    vim.keymap.set("n", "<C-l>", function()
      harpoon:list():select(2)
    end, { silent = true, desc = "Harpoon: File 2" })
    vim.keymap.set("n", "<C-n>", function()
      harpoon:list():select(3)
    end, { silent = true, desc = "Harpoon: File 3" })
    vim.keymap.set("n", "<C-p>", function()
      harpoon:list():select(4)
    end, { silent = true, desc = "Harpoon: File 4" })
  end,
}
