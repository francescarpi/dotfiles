return {
  {
    "francescarpi/buffon.nvim",
    -- dir = "~/dev/cesc/buffon.nvim",
    ---@type BuffonConfig
    opts = {
      num_pages = 2,
      -- new_buffer_position = "after"
      theme = {
        transparent = true,
      },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    },
  },
}
