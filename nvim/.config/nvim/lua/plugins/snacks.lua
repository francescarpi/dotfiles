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
        "<leader>fd",
        function()
          Snacks.picker.diagnostics()
        end,
        desc = "Diagnostics",
      },
      {
        "<leader>g",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
    },
  },
}
