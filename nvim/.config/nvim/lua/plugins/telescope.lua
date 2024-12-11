return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-tree/nvim-web-devicons", enabled = true },
    },
    config = function()
      local actions = require("telescope.actions")
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        pickers = {
          buffers = {
            mappings = {
              i = {
                ["<c-d>"] = actions.delete_buffer,
              },
            },
          },
        },
        defaults = {
          file_ignore_patterns = {
            "node_modules",
          },
          mappings = {
            i = {
              ["<esc>"] = actions.close,
            },
          },
        },
      })

      vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[S]earch [K]eymaps", silent = true })
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[S]earch [F]iles", silent = true })
      vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume last search", silent = true })
      vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Search Diagnostics", silent = true })
      vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers", silent = true })

      require("plugins.telescope_plugins.multigrep").setup()
    end,
  },
}
