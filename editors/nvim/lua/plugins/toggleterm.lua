vim.g.terminal = nil

return {
  "akinsho/toggleterm.nvim",
  config = function()
    local Terminal = require("toggleterm.terminal").Terminal
    vim.g.terminal = Terminal:new({ hidden = true })

    vim.keymap.set("n", "<leader>t", function()
      vim.g.terminal:open()
    end, { silent = true, desc = "ToogleTerm: Toggle" })
  end,
}
