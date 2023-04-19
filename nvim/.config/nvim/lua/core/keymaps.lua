-- -----------------------------------------------------------------------------------------------
-- Keymaps
-- -----------------------------------------------------------------------------------------------

-- Nvim-Tree
vim.keymap.set("n", "<leader>v", ":NvimTreeToggle<CR>", { silent = true })

-- telescope
vim.keymap.set("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files{hidden = true}<CR>", { silent = true })
vim.keymap.set("n", "<leader>ft", "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>", { silent = true })
vim.keymap.set("n", "<leader>fs", "<cmd>lua require'telescope.builtin'.live_grep{}<CR>", { silent = true })
vim.keymap.set("n", "<leader>fb", "<cmd>lua require'telescope.builtin'.buffers{}<CR>", { silent = true })

-- back to previous buffer
vim.keymap.set("n", "<C-l>", ":b#<CR>", { silent = true })

-- open neogit
vim.keymap.set("n", "<leader>g", ":Neogit<CR>", { silent = true })

-- diagnostic
vim.keymap.set("n", "<leader>dd", "<cmd>lua vim.diagnostic.disable(0)<CR>", { silent = true })
vim.keymap.set("n", "<leader>de", "<cmd>lua vim.diagnostic.enable(0)<CR>", { silent = true })

-- harpoon
vim.keymap.set("n", "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", { silent = true })
vim.keymap.set("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>", { silent = true })
vim.keymap.set("n", "<leader>hd", "<cmd>lua require('harpoon.mark').rm_file()<CR>", { silent = true })
vim.keymap.set("n", "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", { silent = true })
vim.keymap.set("n", "<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", { silent = true })
vim.keymap.set("n", "<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", { silent = true })
vim.keymap.set("n", "<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", { silent = true })

-- page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })
vim.keymap.set("n", "n", "nzzzv", { silent = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true })

-- Search/Replacement
vim.keymap.set("n", "<leader>ro", ":SearchReplaceSingleBufferOpen<CR>", { silent = true })
