return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    vim.keymap.set("n", "<leader><tab>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { silent = true, desc = "Harpoon: Toggle quick menu" })

    vim.keymap.set("n", "<leader>a", function()
      print("File added to Harpoon list")
      harpoon:list():add()
    end, { silent = true, desc = "Harpoon: Add file" })

    vim.keymap.set("n", "<C-S-I>", function()
      harpoon:list():prev()
    end, { silent = true, desc = "Harpoon: Jump to previous" })

    vim.keymap.set("n", "<C-S-O>", function()
      harpoon:list():next()
    end, { silent = true, desc = "Harpoon: Jump to next" })

    for i = 1, 5, 1 do
      vim.keymap.set("n", "<C-" .. i .. ">", function()
        harpoon:list():select(i)
      end, { silent = true, desc = "Harpoon: Jump to file with index " .. i })
    end

    vim.keymap.set("n", "<C-h>", function()
      harpoon:list():select(1)
    end)
    vim.keymap.set("n", "<C-l>", function()
      harpoon:list():select(2)
    end)
    vim.keymap.set("n", "<C-n>", function()
      harpoon:list():select(3)
    end)
    vim.keymap.set("n", "<C-p>", function()
      harpoon:list():select(4)
    end)
  end,
}
