local prompts = {
  TranslateEn = "Traduce este texto al ingles",
  TranslateEs = "Traduce este texto al español",
}

return {
  {
    "github/copilot.vim",
    opts = {},
    dependencies = {
      "zbirenbaum/copilot.lua",
    },
    config = function()
      require("copilot").setup()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_filetypes = {
        ["*"] = true,
        ["copilot-chat"] = false,
      }
      vim.keymap.set("i", "<c-j>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    cmd = "CopilotChat",
    keys = {
      {
        "<leader>aa",
        mode = { "n", "i", "v" },
        "<cmd>CopilotChatToggle<CR>",
        desc = "Toggle Copilot Chat",
      },
      {
        "<leader>ap",
        mode = { "n", "v" },
        "<cmd>CopilotChatPrompts<CR>",
        desc = "Open Copilot Chat Prompts",
      },
    },
    opts = {
      prompts = prompts,
      -- system_prompt = "",
      model = "gemini-2.5-pro",
      -- auto_insert_mode = true,
    },
    config = function(_, opts)
      local chat = require("CopilotChat")

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-chat",
        callback = function()
          vim.opt_local.relativenumber = true
          vim.opt_local.number = false
        end,
      })

      chat.setup(opts)
    end,
  },
}
