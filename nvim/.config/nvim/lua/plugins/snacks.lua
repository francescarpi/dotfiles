local HOME = vim.loop.os_getenv("HOME")

return {
  {

    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      indent = { enabled = true },
      image = { enabled = true },
      input = { enabled = true },
      terminal = { enabled = true },
      picker = {
        enabled = true,
        layout = "ivy_split",
        win = {
          input = {
            keys = {
              ["<Esc>"] = { "close", mode = { "n", "i" } },
            },
          },
        },
      },
      notifier = {
        enabled = true,
        top_down = false,
        margin = {
          bottom = 2,
        },
      },
      quickfile = { enabled = true },
      scope = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      lazygit = {
        enabled = true,
        win = {
          style = {
            border = "rounded",
          },
        },
      },
    },
    keys = {
      {
        "<leader>ff",
        function()
          Snacks.picker.files({ hidden = true })
        end,
        desc = "Find Files",
      },
      {
        "<leader>fg",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep",
      },
      {
        "<leader>fr",
        function()
          Snacks.picker.resume()
        end,
        desc = "Resume",
      },
      {
        "<leader><leader>",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Buffers",
      },
      {
        "<leader>fj",
        function()
          Snacks.picker.grep({ cwd = HOME .. "/.journal" })
        end,
        desc = "Grep in journal folder",
      },
      {
        "<leader>g",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
      {
        "<leader>t",
        function()
          Snacks.terminal()
        end,
        desc = "Terminal",
      },
    },
  },
}
