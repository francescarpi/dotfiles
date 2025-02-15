return {
  "echasnovski/mini.nvim",
  config = function()
    require("mini.surround").setup()
    require("mini.comment").setup()
    require("mini.cursorword").setup()
    require("mini.statusline").setup({ use_icons = true })
    require("mini.pairs").setup()
    require("mini.jump2d").setup()

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
  end,
}
