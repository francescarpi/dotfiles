return {
  -- add monokai
  {
    "tanvirtin/monokai.nvim",
    priority = 1000,
    config = function()
      require("monokai").setup({
        custom_hlgroups = {
          TabLineSel = {
            bg = "#ff0000",
          },
          CursorLineNr = {
            fg = "#ff0000",
          },
        },
      })
    end,
  },
  -- configure LazyVim to load monokai
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai",
    },
  },
}
