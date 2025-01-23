local file_ignore_patterns = {
  "node_modules",
  ".git",
}

local register_key_bindings = function()
  local builtin = require("telescope.builtin")
  local multigrep = require("plugins.telescope_plugins.multigrep")

  vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Search Keymaps", silent = true })
  vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Search Files", silent = true })
  vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume last search", silent = true })
  vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Search Diagnostics", silent = true })
  vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find existing buffers", silent = true })
  vim.keymap.set("n", "<leader>fg", multigrep, { desc = "Grep allowing filter by file", silent = true })
  vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags", silent = true })
  vim.keymap.set("n", "<leader>fj", function()
    multigrep({ cwd = "$HOME/.journal" })
  end, { desc = "Grep within the the journal folder", silent = true })
  vim.keymap.set("n", "<leader>fw", function()
    builtin.find_files({ cwd = "$HOME/.dotfiles" })
  end, { desc = "Find files within .dotfiles folder", silent = true })
end

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
      require("telescope").setup({
        pickers = {
          find_files = {
            hidden = true,
          },
          buffers = {
            mappings = {
              i = {
                ["<c-d>"] = actions.delete_buffer,
              },
            },
          },
        },
        defaults = {
          file_ignore_patterns = file_ignore_patterns,
          mappings = {
            i = {
              ["<esc>"] = actions.close,
            },
          },
        },
      })

      register_key_bindings()
    end,
  },
}
