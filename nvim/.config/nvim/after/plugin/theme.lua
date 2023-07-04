-- vim.cmd [[colorscheme monokai]]
-- vim.cmd("highlight TabLineSel guibg=#ffaf26 guifg=#000000")

vim.cmd [[colorscheme dracula]]
vim.cmd("highlight TabLineSel guibg=#bd93f9 guifg=#000000")

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
