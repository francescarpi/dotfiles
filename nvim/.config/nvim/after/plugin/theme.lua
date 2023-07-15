local monokai = require('monokai')

vim.cmd [[colorscheme monokai]]
vim.cmd("highlight TabLineSel guibg=#ffaf26 guifg=#000000")

-- Neogit
vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", { fg = monokai.classic.green, bg = monokai.classic.base0 })
vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { fg = monokai.classic.red, bg = monokai.classic.base0 })
vim.api.nvim_set_hl(0, "NeogitDiffContextHighlight", { fg = "#b2b2b2", bg = monokai.classic.base0 })
vim.api.nvim_set_hl(0, "NeogitHunkHeader", { fg = "#073642", bg = "#ffaf26" })
vim.api.nvim_set_hl(0, "NeogitHunkHeaderHighlight", { fg = "#073642", bg = "#ffaf26" })
