return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    vim.keymap.set("n", "<leader>m", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { silent = true, desc = "Harpoon: Toggle quick menu" })

    vim.keymap.set("n", "<leader>a", function()
      print("File appended")
      harpoon:list():add()
    end, { silent = true, desc = "Harpoon: Append file" })

    vim.keymap.set("n", "<leader>A", function()
      print("File prepended")
      harpoon:list():prepend()
    end, { silent = true, desc = "Harpoon: Prepend file" })

    vim.keymap.set("n", "<S-h>", function()
      harpoon:list():select(1)
    end, { silent = true, desc = "Harpoon: File 1" })

    vim.keymap.set("n", "<S-j>", function()
      harpoon:list():select(2)
    end, { silent = true, desc = "Harpoon: File 2" })

    vim.keymap.set("n", "<S-k>", function()
      harpoon:list():select(3)
    end, { silent = true, desc = "Harpoon: File 3" })

    vim.keymap.set("n", "<S-l>", function()
      harpoon:list():select(4)
    end, { silent = true, desc = "Harpoon: File 4" })

    vim.keymap.set("n", "]w", function()
      harpoon:list():next()
    end, { silent = true })
    vim.keymap.set("n", "[w", function()
      harpoon:list():prev()
    end, { silent = true })
  end,
}
