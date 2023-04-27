-- -----------------------------------------------------------------------------------------------
-- Remap keys
-- -----------------------------------------------------------------------------------------------

-- back to previous buffer
vim.keymap.set("n", "<C-l>", ":b#<CR>", { silent = true, desc = "Switch to last buffer" })

-- delete current buffer
vim.keymap.set("n", "<leader>k", ":bdelete<CR>", { silent = true, desc = "Switch to last buffer" })

-- diagnostic
vim.keymap.set(
  "n",
  "<leader>dd",
  "<cmd>lua vim.diagnostic.disable(0)<CR>",
  { silent = true, desc = "Disable diagnostics" }
)
vim.keymap.set(
  "n",
  "<leader>de",
  "<cmd>lua vim.diagnostic.enable(0)<CR>",
  { silent = true, desc = "Enable diagnostics" }
)

-- page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })
vim.keymap.set("n", "n", "nzzzv", { silent = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true })

-- Resize panels
vim.keymap.set("n", "+", ":vertical res +10<CR>", { silent = true, desc = "Increase panel size" })
vim.keymap.set("n", "-", ":vertical res -10<CR>", { silent = true, desc = "Decrease panel size" })

-- move blocks in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move visual block above" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move visual block below" })
