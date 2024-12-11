return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-tree/nvim-web-devicons", enabled = true },
    },
    config = function()
      local actions = require("telescope.actions")
      local telescope = require("telescope")
      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
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

      -- Enable Telescope extensions if they are installed
      pcall(telescope.load_extension, "ui-select")

      -- See `:help telescope.builtin`
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[S]earch [K]eymaps", silent = true })
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[S]earch [F]iles", silent = true })
      vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume last search", silent = true })
      vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Search Diagnostics", silent = true })
      vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers", silent = true })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set("n", "<leader>/", function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end, { desc = "[/] Fuzzily search in current buffer" })

      require("plugins.telescope_plugins.multigrep").setup()
    end,
  },
}
