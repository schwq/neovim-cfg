local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
  "vim-airline/vim-airline",
  { 'rose-pine/neovim', name = 'rose-pine' },
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',
     { 'neovim/nvim-lspconfig' },
     { 'hrsh7th/nvim-cmp', config = [[require('config.nvim-cmp')]] },    
     { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }, 
     { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },        -- buffer auto-completion
     { 'hrsh7th/cmp-path', after = 'nvim-cmp' },          -- path auto-completion
     { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },       -- cmdline auto-completion
     'L3MON4D3/LuaSnip',
     'saadparwaiz1/cmp_luasnip',
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim'},
    'vim-airline/vim-airline-themes', 
})

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
