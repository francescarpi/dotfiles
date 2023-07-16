local monokai = require('monokai')

vim.cmd [[colorscheme monokai]]

------------------------------------------------------------------------------
-- Neogit
vim.api.nvim_set_hl(0, "NeogitStagedchanges", { fg = monokai.classic.aqua, bg = monokai.classic.base0 })        -- Unstaged changes
vim.api.nvim_set_hl(0, "NeogitUnstagedchanges", { fg = monokai.classic.aqua, bg = monokai.classic.base0 })        -- Unstaged changes
vim.api.nvim_set_hl(0, "NeogitRecentCommits", { fg = monokai.classic.aqua, bg = monokai.classic.base0 })          -- Recent commits
vim.api.nvim_set_hl(0, "NeogitBranch", { fg = monokai.classic.yellow, bg = monokai.classic.base0 })               -- Head branch
vim.api.nvim_set_hl(0, "NeogitRemote", { fg = monokai.classic.yellow, bg = monokai.classic.base0 })               -- Push branch

vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", { fg = monokai.classic.green, bg = monokai.classic.base0 })      -- Added
vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { fg = monokai.classic.pink, bg = monokai.classic.base0 })    -- Removed

vim.api.nvim_set_hl(0, "NeogitHunkHeader", { fg = monokai.classic.orange, bg = monokai.classic.base0 })           -- Header
vim.api.nvim_set_hl(0, "NeogitHunkHeaderHighlight", { fg = monokai.classic.orange, bg = monokai.classic.base0 })  -- Header highlighted

------------------------------------------------------------------------------
-- tabs
vim.cmd("highlight TabLineSel guibg=#ffaf26 guifg=#000000")

