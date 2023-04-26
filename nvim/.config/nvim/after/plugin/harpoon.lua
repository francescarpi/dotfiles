require('harpoon').setup {}

vim.keymap.set("n", "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", { silent = true })
vim.keymap.set("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>", { silent = true })
vim.keymap.set("n", "<leader>hd", "<cmd>lua require('harpoon.mark').rm_file()<CR>", { silent = true })
vim.keymap.set("n", "<C-1>", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", { silent = true })
vim.keymap.set("n", "<C-2>", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", { silent = true })
vim.keymap.set("n", "<C-3>", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", { silent = true })
vim.keymap.set("n", "<C-4>", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", { silent = true })
vim.keymap.set("n", "<C-3>", "<cmd>lua require('harpoon.ui').nav_file(5)<CR>", { silent = true })
