return {
  -- add monokai
  {
    "tanvirtin/monokai.nvim",
  },
  -- configure LazyVim to load monokai
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai",
    },
  },
}
