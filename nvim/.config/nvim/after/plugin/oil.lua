require("oil").setup()

-- vim.keymap.set("n", "<leader>v", ":NvimTreeToggle<CR>", { silent = true, desc = "Nvimtree: Toggle" })
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

