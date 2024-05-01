-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Exit to normal mode
vim.keymap.set("i", "jj", "<esc>", { desc = "Exit to normal mode" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>x", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>qf", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<leader>td", ":ToggleDiagnostics<CR>", { desc = "Toggle diagnostic", silent = true })

-- Format keys
vim.keymap.set("n", "<leader>tf", ":ToggleFormatOnSave<CR>", { desc = "Toggle format", silent = true })

-- Switch faster between buffers
vim.keymap.set("n", "<C-m>", "<cmd>e #<cr>", { desc = "Switch to other buffer" })

-- Delete current buffer
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { silent = true, desc = "Delete current buffer" })
vim.keymap.set("n", "<leader>bq", ":q<CR>", { silent = true, desc = "Quit from current window" })

-- Save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Quit all
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Move lines
vim.keymap.set("n", "<C-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<C-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<C-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<C-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<C-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Move between buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

--Adjust scroll on page up/down or next search result
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
