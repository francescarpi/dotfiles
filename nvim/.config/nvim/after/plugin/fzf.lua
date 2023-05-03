local fzf = require('fzf-lua')

fzf.setup {
  file_ignore_patterns = { ".git", "node_modules", ".venv" },
}

vim.keymap.set("n", "<leader>df", fzf.files, { silent = true, desc = "Fzf: files" })
vim.keymap.set("n", "<leader>dt", fzf.btags, { silent = true, desc = "Fzf: tags" })
vim.keymap.set("n", "<leader>ds", fzf.live_grep, { silent = true, desc = "Fzf: live grep" })
vim.keymap.set("n", "<leader>db", fzf.buffers, { silent = true, desc = "Fzf: buffers" })
vim.keymap.set("n", "<leader>dd", fzf.diagnostics_document, { silent = true, desc = "Fzf: Diagnostics" })
vim.keymap.set("n", "<leader>dk", fzf.keymaps, { silent = true, desc = "Fzf: Keymaps" })

