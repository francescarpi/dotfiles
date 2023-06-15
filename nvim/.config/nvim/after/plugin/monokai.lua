local monokai = require('monokai')

monokai.setup {
  custom_hlgroups = {
    TabLineSel = {
      fg = monokai.pro.yellow
    }
  }
}

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

