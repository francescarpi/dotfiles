-- -- -----------------------------------------------------------------------------------------------
-- Plugin installation
-- -----------------------------------------------------------------------------------------------
-- Automatically install Packer if it isn't installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd("packadd packer.nvim")
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  -- themes
  use("tanvirtin/monokai.nvim")

  -- Used by LuaLine and nvim-tree
  use({ "kyazdani42/nvim-web-devicons" })

  -- Pretty indentation lines
  use({ "lukas-reineke/indent-blankline.nvim", tag = "v2.20.2" })

  -- Commenting tool
  use({ "numToStr/Comment.nvim", commit = "7bb563f" })

  -- Status line at the bottom
  use({ "nvim-lualine/lualine.nvim", commit = "32a7382" })

  -- File browser
  use({ "nvim-tree/nvim-tree.lua", commit = "bac962c" })

  -- Coq
  use({ "ms-jpq/coq_nvim", branch = "coq", commit = "6ca8641" })
  use({ "ms-jpq/coq.artifacts", branch = "artifacts", commit = "9d90bbf" })

  -- LSP (The rest is configured in lua/lsp.lua)
  use({ "nvim-lua/plenary.nvim", commit = "bb44479" }) -- used by stuff below
  use({ "williamboman/mason.nvim", commit = "dac1093" })
  use({ "williamboman/mason-lspconfig.nvim", commit = "aa25b41" })
  use({ "neovim/nvim-lspconfig", commit = "e69978a" })
  use({ "jose-elias-alvarez/null-ls.nvim", commit = "d09d7d8" })
  use({ "jay-babu/mason-null-ls.nvim", commit = "1fcf055" })

  -- TreeSitter
  use({ "nvim-treesitter/nvim-treesitter", commit = "e9fb90d" })
  use({ "nvim-treesitter/nvim-treesitter-context", commit = "38203f5" })

  -- FZF
  use({ "ibhagwan/fzf-lua", commit = "061a4df" })

  -- Neogit
  use({ "sindrets/diffview.nvim", commit = "18d88c8" })
  use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim", commit = "039ff32" })

  -- gitsigns
  use({ "lewis6991/gitsigns.nvim", tag = "v0.6" })

  -- surround
  use({ "tpope/vim-surround", commit = "3d188ed" })

  -- autopairs
  use({ "windwp/nvim-autopairs", commit = "7470af8" })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)

-- -----------------------------------------------------------------------------------------------
-- Plugin config
-- -----------------------------------------------------------------------------------------------
-- Configure some of the simpler plugins
require("nvim-tree").setup()

require("Comment").setup()

require("lualine").setup({
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { { "filename", path = 1 } },
    lualine_x = { 'filetype' },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})

require("nvim-treesitter.configs").setup({
  -- A list of parser names, or "all"
  ensure_installed = {
    "bash",
    "git_rebase",
    "gitcommit",
    "python",
    "lua",
    "typescript",
    "terraform",
    "yaml",
    "sql",
    "html",
    "vim",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
})

require("neogit").setup({
  -- disable_signs = true,
  integrations = {
    diffview = true,
  },
})

require("gitsigns").setup({ current_line_blame = true })

require('fzf-lua').setup()

require("nvim-autopairs").setup()

-- -----------------------------------------------------------------------------------------------
-- General configuration
-- -----------------------------------------------------------------------------------------------
-- Basic settings
vim.opt.hlsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.spelllang = "en_gb"

-- use nvim-tree instead
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Use system clipboard
vim.opt.clipboard = "unnamed"

-- Display settings
vim.opt.cursorline = true
vim.opt.colorcolumn = "120"
vim.cmd("colorscheme monokai_pro")

-- Title
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to

-- Persist undo
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.opt.undofile = true

-- Tab stuff
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Search configuration
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true

-- open new split panes to right and below (as you probably expect)
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Highlight trailing characters
vim.opt.listchars = {
  -- eol = "↲",
  tab = "▸ ",
  trail = "·",
}
vim.opt.list = true

-- Spell check certain file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "latex", "tex", "md", "markdown" },
  command = "setlocal spell",
})

-- leader timeout
vim.opt.updatetime = 100

-- -----------------------------------------------------------------------------------------------
-- Keymap settings
-- -----------------------------------------------------------------------------------------------
-- Change leader key and use space for :
vim.g.mapleader = ","

-- nvim-tree
vim.keymap.set("n", "<leader>v", ":NvimTreeToggle<CR>")

-- fzf
 vim.keymap.set("n", "<leader>ff","<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
 vim.keymap.set("n", "<leader>ft","<cmd>lua require('fzf-lua').btags()<CR>", { silent = true })
 vim.keymap.set("n", "<leader>fta","<cmd>lua require('fzf-lua').tags()<CR>", { silent = true })
 vim.keymap.set("n", "<leader>fs","<cmd>lua require('fzf-lua').grep()<CR>", { silent = true })
 vim.keymap.set("n", "<leader>fb","<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })
 vim.keymap.set("n", "<leader>fd","<cmd>lua require('fzf-lua').diagnostics_document()<CR>", { silent = true })

-- search
vim.keymap.set("n", "<esc>", ":noh<CR>", { silent = true })

-- back to previous buffer
vim.keymap.set("n", "<C-l>", ":b#<CR>", { silent = true })

-- open neogit
vim.keymap.set("n", "<leader>git", ":Neogit<CR>")

-- diagnostic
 vim.keymap.set("n", "<leader>dd","<cmd>lua vim.diagnostic.disable(0)<CR>", { silent = true })
 vim.keymap.set("n", "<leader>de","<cmd>lua vim.diagnostic.enable(0)<CR>", { silent = true })

-- Server specific LSP keymaps
-- Called by the `on_attach` in the lspconfig setup
local server_maps = function(bufopts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<leader>fo", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)
end

-- -----------------------------------------------------------------------------------------------
-- LSP stuff
-- -----------------------------------------------------------------------------------------------
-- List of LSP servers to install with Mason and activate in LspConfig
local lsp_servers = {
  pyright = {},
  ruff_lsp = {  settings = { args = { "--line-length", "120" }, organizeImports = true, fixAll = true } } ,
  eslint = {},
  jsonls = {},
  tailwindcss = {},
  tsserver = {},
  sumneko_lua = { Lua = { diagnostics = { globals = { "vim" } } } },
  yamlls = {},
  volar = {},
}
-- Setup Mason and auto-install some LSPs
-- Mason handles the actual installations,
-- while mason-lspconfig does the automatation
-- and linking with neovim-lspconfig
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = lsp_servers,
  automatic_installation = true,
})

-- Null-ls is used to set up linters, formatters etc
-- This is the method recommended by mason-null-ls
-- Similar to above, null-ls handles the link with
-- lspconfig, while mason-null-ls handles auto-install
-- and gets Mason to install the things
require("mason-null-ls").setup({
  ensure_installed = {
    "stylua",
    "jq",
    "isort",
    "black",
    "prettierd",
  },
  automatic_installation = true,
  automatic_setup = true,
})

require("null-ls").setup()
require("mason-null-ls").setup_handlers()

-- COQ autocomplete needed to be set up here
vim.g.coq_settings = {
  auto_start = "shut-up",
  keymap = {
    jump_to_mark = "", -- Prevent clash with split jumping
    eval_snips = "<leader>j",
    pre_select = true
  },
}
local coq = require("coq")

-- The null-ls stuff is activated automatically up above
-- by `setup_handlers()`, but the LSP servers need to be
-- manually set up here. Each one is setup() and COQ is
-- activated for them at the same time.
for lsp, settings in pairs(lsp_servers) do
  require("lspconfig")[lsp].setup(coq.lsp_ensure_capabilities({
    on_attach = function(_, buffer)
      server_maps({ buffer = buffer })
    end,
    settings = settings,
    init_options = settings,
  }))
end

