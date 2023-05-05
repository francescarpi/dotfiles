require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      ".git",
      "node_modules",
      ".venv",
      "img",
      "fonts",
      "images",
    },
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      },
    },
  },
}


vim.keymap.set("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files{hidden = true}<CR>", { silent = true, desc = "Telescope: files" })
vim.keymap.set("n", "<leader>ft", "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>", { silent = true, desc = "Telescope: tags" })
vim.keymap.set("n", "<leader>fs", "<cmd>lua require'telescope.builtin'.live_grep{}<CR>", { silent = true, desc = "Telescope: grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>lua require'telescope.builtin'.buffers{}<CR>", { silent = true, desc = "Telescope: buffers" })
vim.keymap.set("n", "<leader>fd", "<cmd>lua require'telescope.builtin'.diagnostics{}<CR>", { silent = true, desc = "Telescope: diagnostics" })
vim.keymap.set("n", "<leader>fk", "<cmd>lua require'telescope.builtin'.keymaps{}<CR>", { silent = true, desc = "Telescope: keymaps" })
