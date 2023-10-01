return {
  'easymotion/vim-easymotion',
  config = function()
    vim.keymap.set("n", "<leader>s", '<Plug>(easymotion-overwin-f)', { desc = "Easymotion: Move to char" })
  end
}
