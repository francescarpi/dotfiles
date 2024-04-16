-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Exit to normal mode
vim.keymap.set("i", "jj", "<esc>", { desc = "Exit to normal mode" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Switch faster between buffers
vim.keymap.set("n", "<C-m>", "<cmd>e #<cr>", { desc = "Switch to other buffer" })

-- Delete current buffer
vim.keymap.set("n", "<leader>k", ":bdelete<CR>", { silent = true, desc = "Delete current buffer" })
