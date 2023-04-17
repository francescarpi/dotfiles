-- -----------------------------------------------------------------------------------------------
-- Keymaps
-- -----------------------------------------------------------------------------------------------

-- Nvim-Tree
vim.keymap.set("n", "<leader>v", ":NvimTreeToggle<CR>", { silent = true })

-- fzf
vim.keymap.set("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set("n", "<leader>ft", "<cmd>lua require('fzf-lua').btags()<CR>", { silent = true })
vim.keymap.set("n", "<leader>fta", "<cmd>lua require('fzf-lua').tags()<CR>", { silent = true })
vim.keymap.set("n", "<leader>fs", "<cmd>lua require('fzf-lua').live_grep()<CR>", { silent = true })
vim.keymap.set("n", "<leader>fb", "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })
vim.keymap.set("n", "<leader>fd", "<cmd>lua require('fzf-lua').diagnostics_document()<CR>", { silent = true })
vim.keymap.set("n", "<leader>fgb", "<cmd>lua require('fzf-lua').git_branches()<CR>", { silent = true })

-- back to previous buffer
vim.keymap.set("n", "<C-l>", ":b#<CR>", { silent = true })

-- open neogit
vim.keymap.set("n", "<leader>git", ":Neogit<CR>", { silent = true })

-- diagnostic
vim.keymap.set("n", "<leader>dd", "<cmd>lua vim.diagnostic.disable(0)<CR>", { silent = true })
vim.keymap.set("n", "<leader>de", "<cmd>lua vim.diagnostic.enable(0)<CR>", { silent = true })

