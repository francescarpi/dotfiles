local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

require('harpoon').setup {}

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon: Add file" })
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu, { desc = "Harpoon: Toggle" })

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, { desc = "Harpoon: File 1" })
vim.keymap.set("n", "<C-n>", function() ui.nav_file(2) end, { desc = "Harpoon: File 2" })
vim.keymap.set("n", "<C-t>", function() ui.nav_file(3) end, { desc = "Harpoon: File 3" })
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end, { desc = "Harpoon: File 4" })
