local monokai = require('monokai')

vim.cmd [[colorscheme monokai]]
vim.cmd("highlight TabLineSel guibg=#ffaf26 guifg=#000000")

require('lualine').setup {
  options = {
    disabled_filetypes = {
      statusline = { "NvimTree" },
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { { "filename", path = 1 } },
    lualine_x = { "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
}

-- Neogit
vim.cmd("hi def NeogitDiffAddHighlight guibg=" .. monokai.classic.base0 .. " guifg=" .. monokai.classic.green)
vim.cmd("hi def NeogitDiffDeleteHighlight guibg=" .. monokai.classic.base0 .. " guifg=" .. monokai.classic.red)
vim.cmd("hi def NeogitDiffContextHighlight guibg=" .. monokai.classic.base0 .. " guifg=#b2b2b2")
