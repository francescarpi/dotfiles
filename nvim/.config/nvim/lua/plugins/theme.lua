return {
  -- add monokai
  {
    -- "tanvirtin/monokai.nvim",
    "folke/tokyonight.nvim",
  },
  -- configure LazyVim to load monokai
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
