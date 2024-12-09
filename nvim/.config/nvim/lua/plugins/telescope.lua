return {
  { -- Fuzzy Finder (files, lsp, etc)
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-tree/nvim-web-devicons", enabled = true },
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        version = "^1.0.0",
      },
    },
    config = function()
      local actions = require("telescope.actions")
      local telescope = require("telescope")
      local lga_actions = require("telescope-live-grep-args.actions")
      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
          live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
            mappings = { -- extend mappings
              i = {
                ["<C-k>"] = lga_actions.quote_prompt(),
                ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                -- freeze the current list and start a fuzzy search in the frozen list
                ["<C-space>"] = actions.to_fuzzy_refine,
              },
            },
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
      pcall(telescope.load_extension, "fzf")
      pcall(telescope.load_extension, "ui-select")
      pcall(telescope.load_extension, "live_grep_args")

      -- See `:help telescope.builtin`
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[S]earch [K]eymaps", silent = true })
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[S]earch [F]iles", silent = true })
      vim.keymap.set(
        "n",
        "<leader>fg",
        ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
        { desc = "[S]earch by [G]rep", silent = true }
      )
      vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume last search", silent = true })
      vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Search Diagnostics", silent = true })
      vim.keymap.set(
        "n",
        "<leader>f.",
        builtin.oldfiles,
        { desc = '[S]earch Recent Files ("." for repeat)', silent = true }
      )
      vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers", silent = true })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set("n", "<leader>/", function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end, { desc = "[/] Fuzzily search in current buffer" })
    end,
  },
}
