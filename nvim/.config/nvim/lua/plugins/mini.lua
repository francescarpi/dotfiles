return {
  "nvim-mini/mini.nvim",
  config = function()
    require("mini.surround").setup()
    require("mini.git").setup()
    require("mini.diff").setup()
    require("mini.comment").setup()
    require("mini.statusline").setup({ use_icons = true })
    require("mini.cursorword").setup()

    -- Hipatterns
    local hipatterns = require("mini.hipatterns")
    require("mini.hipatterns").setup({
      highlighters = {
        todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
        fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
        note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    })

    -- Mini files
    require("mini.files").setup({
      mappings = {
        go_in_plus = "<CR>",
      },
    })

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
  end,
}
