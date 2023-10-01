return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    local nvimtree = require('nvim-tree')
    nvimtree.setup({
      hijack_cursor = false,
      update_focused_file = {
        enable = true,
      },
      filters = {
        dotfiles = true
      },
      view = {
        width = 55
      }
    })

    vim.keymap.set("n", "<leader>v", ":NvimTreeToggle<CR>", { silent = true, desc = "Nvimtree: Toggle" })
  end
}
