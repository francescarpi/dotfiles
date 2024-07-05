return {
  "laytan/cloak.nvim",
  config = function()
    require("cloak").setup({
      patterns = {
        {
          file_pattern = ".env*",
          cloak_pattern = "=.+",
        },
        {
          file_pattern = "*.py",
          cloak_pattern = "(access_token=).+",
          replace = "%1",
        },
      },
    })
  end,
}
