return {
  {
    "romus204/tree-sitter-manager.nvim",
    dependencies = {},
    lazy = false,
    config = function()
      require("tree-sitter-manager").setup({})
    end,
  },
}
