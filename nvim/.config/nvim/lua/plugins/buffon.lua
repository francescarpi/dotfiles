return {
  {
    -- "francescarpi/buffon.nvim",
    dir = "~/dev/neovim/buffon.nvim",
    ---@type BuffonConfig
    opts = {
      -- sort_buffers_by_loaded_status = true,
      -- num_pages = 1,
      -- keybindings = {
      --   goto_next_buffer = "false",
      --   goto_previous_buffer = "false",
      -- },
      -- open = {
      --   default_position = "bottom_right",
      -- }
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    },
  },
}
