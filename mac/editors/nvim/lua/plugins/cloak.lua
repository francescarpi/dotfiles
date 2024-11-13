return {
  "laytan/cloak.nvim",
  opts = {
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
  },
}
