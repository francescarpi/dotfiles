-- -----------------------------------------------------------------------------------------------
-- Remap keys
-- -----------------------------------------------------------------------------------------------

-- back to previous buffer
vim.keymap.set("n", "<C-m>", ":b#<CR>", { silent = true, desc = "Switch to last buffer" })

-- delete current buffer
vim.keymap.set("n", "<leader>k", ":bdelete<CR>", { silent = true, desc = "Close current buffer" })

-- close panel
vim.keymap.set("n", "<leader>c", ":clo<CR>", { silent = true, desc = "Close current panel" })

-- diagnostic
vim.keymap.set("n", "<leader>dd", "<cmd>lua vim.diagnostic.disable(0)<CR>", { silent = true, desc = "Diagnostics: Disable" })
vim.keymap.set("n", "<leader>de", "<cmd>lua vim.diagnostic.enable(0)<CR>", { silent = true, desc = "Diagnostics: Enable" })

-- page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })
-- vim.keymap.set("n", "n", "nzzzv", { silent = true })
-- vim.keymap.set("n", "N", "Nzzzv", { silent = true })

-- Resize panels
vim.keymap.set("n", "<A-right>", ":vertical res +5<CR>", { silent = true, desc = "Increase panel size (V)" })
vim.keymap.set("n", "<A-left>", ":vertical res -5<CR>", { silent = true, desc = "Decrease panel size (V)" })
vim.keymap.set("n", "<A-up>", ":horizontal res +5<CR>", { silent = true, desc = "Increase panel size (H)" })
vim.keymap.set("n", "<A-down>", ":horizontal res -5<CR>", { silent = true, desc = "Decrease panel size (H)" })

-- move blocks in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move visual block above" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move visual block below" })

-- move scroll
vim.keymap.set("n", "<C-k>", "<C-y>", { silent = true, desc = "Move scroll up one line" })
vim.keymap.set("n", "<C-j>", "<C-e>", { silent = true, desc = "Move scroll down one line" })

-- save
vim.keymap.set("i", "<C-s>", "<esc>:w<CR>", { desc = "Save current buffer" })
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save current buffer" })

vim.keymap.set("n", "<C-h>", ":tabprevious<CR>", { silent = true, desc = "Go to previous tab" })
vim.keymap.set("n", "<C-l>", ":tabnext<CR>", { silent = true, desc = "Go to next tab" })
vim.keymap.set("i", "<C-h>", "<esc>:tabprevious<CR>gi", { silent = true, desc = "Go to previous tab" })
vim.keymap.set("i", "<C-l>", "<esc>:tabnext<CR>gi", { silent = true, desc = "Go to next tab" })
