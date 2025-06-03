return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio"
    },
    keys = {
      {
        "<leader>dt",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Brakpoint",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>dso",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>dsi",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {},
  },
  {
    "rcarriga/nvim-dap-ui",
    opts = {},
    keys = {
      {
        "<leader>duu",
        function()
          require("dapui").open()
        end,
        desc = "Open DAP UI",
      },
      {
        "<leader>duc",
        function()
          require("dapui").close()
        end,
        desc = "Close DAP UI",
      },
    }
  }
}
