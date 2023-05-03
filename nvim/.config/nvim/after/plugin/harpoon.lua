local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

require('harpoon').setup {}

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add file to harpoon" })
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu, { desc = "Toggle harpoon popup" })

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, { desc = "Nav to harpoon file number 1" })
vim.keymap.set("n", "<C-n>", function() ui.nav_file(2) end, { desc = "Nav to harpoon file number 2" })
vim.keymap.set("n", "<C-t>", function() ui.nav_file(3) end, { desc = "Nav to harpoon file number 3" })
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end, { desc = "Nav to harpoon file number 4" })
