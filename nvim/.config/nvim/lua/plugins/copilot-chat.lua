return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      window = {
        layout = "float",
      },
    },
    keys = {
      {
        "<leader>o",
        ":CopilotChatToggle<CR>",
        mode = "",
        desc = "Copilot chat toggle",
      },
    },
  },
}
