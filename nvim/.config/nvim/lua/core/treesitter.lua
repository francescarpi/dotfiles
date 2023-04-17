-- -----------------------------------------------------------------------------------------------
-- Treesitter
-- -----------------------------------------------------------------------------------------------
require("nvim-treesitter.configs").setup({
  -- A list of parser names, or "all"
  ensure_installed = {
    "bash",
    "git_rebase",
    "gitcommit",
    "python",
    "lua",
    "typescript",
    "terraform",
    "yaml",
    "sql",
    "html",
    "vim",
    "vue",
    "scss",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
})
