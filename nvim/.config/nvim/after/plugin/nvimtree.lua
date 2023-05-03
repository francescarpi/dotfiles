require('nvim-tree').setup {
  hijack_cursor = false,
      update_focused_file = {
        enable = true,
      },
}

vim.keymap.set("n", "<leader>v", ":NvimTreeToggle<CR>", { silent = true, desc = "Nvimtree: Toggle" })
