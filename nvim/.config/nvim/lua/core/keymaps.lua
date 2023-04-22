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
vim.keymap.set("n", "<leader>fd", "<cmd>lua require'telescope.builtin'.diagnostics{}<CR>", { silent = true })
vim.keymap.set("n", "<leader>fk", "<cmd>lua require'telescope.builtin'.keymaps{}<CR>", { silent = true })

-- back to previous buffer
vim.keymap.set("n", "<C-l>", ":b#<CR>", { silent = true })

-- open neogit
vim.keymap.set("n", "<leader>git", ":Neogit<CR>", { silent = true })

-- diagnostic
vim.keymap.set("n", "<leader>dd", "<cmd>lua vim.diagnostic.disable(0)<CR>", { silent = true })
vim.keymap.set("n", "<leader>de", "<cmd>lua vim.diagnostic.enable(0)<CR>", { silent = true })

-- harpoon
vim.keymap.set("n", "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", { silent = true })
vim.keymap.set("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>", { silent = true })
vim.keymap.set("n", "<leader>hd", "<cmd>lua require('harpoon.mark').rm_file()<CR>", { silent = true })
vim.keymap.set("n", "<C-1>", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", { silent = true })
vim.keymap.set("n", "<C-2>", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", { silent = true })
vim.keymap.set("n", "<C-3>", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", { silent = true })
vim.keymap.set("n", "<C-4>", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", { silent = true })
vim.keymap.set("n", "<C-3>", "<cmd>lua require('harpoon.ui').nav_file(5)<CR>", { silent = true })

-- page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })
vim.keymap.set("n", "n", "nzzzv", { silent = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true })

-- Search/Replacement
vim.keymap.set("n", "<leader>ro", ":SearchReplaceSingleBufferOpen<CR>", { silent = true })

-- Resize panels
vim.keymap.set("n", "+", ":vertical res +10<CR>", { silent = true })
vim.keymap.set("n", "-", ":vertical res -10<CR>", { silent = true })

-- under tree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- move blocks in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
