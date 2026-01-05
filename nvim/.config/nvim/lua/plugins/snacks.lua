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
      terminal = { enabled = true, cwd = vim.fn.expand("%:p:h") },
      picker = {
        enabled = true,
        layout = "ivy_split",
        exclude = { ".DEPRECATED", ".git", ".cache", ".vscode", "node_modules", "package-lock.json", "pnpm-lock.yaml" },
        win = {
          input = {
            keys = {
              ["<Esc>"] = { "close", mode = { "n", "i" } },
            },
          },
        },
      },
      quickfile = { enabled = true },
      scope = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = false },
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
        "<leader>fd",
        function()
          Snacks.picker.diagnostics()
        end,
        desc = "Diagnostics",
      },
      {
        "<leader>fG",
        function()
          Snacks.picker.grep({ cwd = vim.fn.expand("%:p:h") })
        end,
        desc = "Grep (from current folder file)",
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
          local cwd = vim.fn.expand("%:p:h")
          if cwd == "" then
            cwd = vim.fn.getcwd()
          end

          Snacks.terminal("zsh", {
            cwd = cwd,
            win = {
              relative = "editor",
              width = 0.8,
              height = 0.7,
              border = "rounded",
              padding = { 4, 1, 1, 1 }, -- Top, right, bottom, left padding
            },
          })
        end,
        desc = "Terminal",
      },
    },
  },
}
