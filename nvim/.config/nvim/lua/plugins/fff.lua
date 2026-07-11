return {
  'dmtrKovalenko/fff.nvim',
  -- for nixos:
  -- build = "nix run .#release",
  opts = {
    debug = {
      enabled = true,
      show_scores = true,
    },
  },
  lazy = true,
  event = "VeryLazy",
  build = function()
    -- downloads a prebuilt binary or falls back to cargo build
    -- run manually with :Lazy build fff.nvim
    require("fff.download").download_or_build_binary()
  end,
  keys = {
    { "ff", function() require('fff').find_files() end, desc = 'FFFind files' },
    { "fg", function() require('fff').live_grep() end,  desc = 'LiFFFe grep' },
    {
      "fz",
      function() require('fff').live_grep({ grep = { modes = { 'fuzzy', 'plain' } } }) end,
      desc = 'Live fffuzy grep',
    },
    {
      "fc",
      function() require('fff').live_grep({ query = vim.fn.expand("<cword>") }) end,
      desc = 'Search current word',
    },
  },
}
