return {
  -- Collection of various small independent plugins/modules
  "echasnovski/mini.nvim",
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require("mini.ai").setup({ n_lines = 500 })

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require("mini.surround").setup()

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require("mini.statusline")
    -- set use_icons to true if you have a Nerd Font
    statusline.setup({ use_icons = true })

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return "%2l:%-2v"
    end

    statusline.section_filename = function(args)
      local format = "off"
      if vim.g.format_on_save then
        format = "on"
      end
      return "format: " .. format .. " | %t%m"
    end

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim

    require("mini.indentscope").setup()
    require("mini.ai").setup()
    require("mini.comment").setup()
    require("mini.cursorword").setup()
    require("mini.pairs").setup()
    require("mini.files").setup({
      mappings = {
        go_in_plus = "<CR>",
      },
      windows = {
        preview = true,
      },
    })

    vim.keymap.set("n", "<leader>E", function()
      local MiniFiles = require("mini.files")
      MiniFiles.open()
    end, { desc = "Toggle mini files at buffer path", silent = true })

    vim.keymap.set("n", "<leader>e", function()
      local buf_name = vim.api.nvim_buf_get_name(0)
      local val = vim.fn.filereadable(buf_name)
      local MiniFiles = require("mini.files")
      if val == 1 then
        MiniFiles.open(buf_name)
        MiniFiles.reveal_cwd()
      else
        MiniFiles.open()
        MiniFiles.reveal_cwd()
      end
    end, { desc = "Toggle mini files", silent = true })

    local hipatterns = require("mini.hipatterns")
    require("mini.hipatterns").setup({
      highlighters = {
        todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
        fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
        note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    })
  end,
}
