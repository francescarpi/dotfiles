return {

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = true, auto_trigger = true },
      })
    end,
  },
  {
    "nikutsuki/bcp.nvim",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("bcp").setup()
    end,
  },
}
