-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- to automatically run :PackerCompile whenever this file is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'

  -- nvim-cmp with vim-vsnip
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- in conjunction with nvim-cmp
  use 'onsails/lspkind.nvim'

  -- for trouble.nvim
  use 'folke/lsp-colors.nvim'
  use {
    'folke/trouble.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- for documentation from lsp
  use {
    "amrbashir/nvim-docs-view",
    cmd = { "DocsViewToggle" },
    config = function()
      require("docs-view").setup {
        position = "right",
        width = 60,
      }
    end
  }

  use {
    'ms-jpq/chadtree',
    branch = 'chad',
    run = 'python3 -m chadtree deps'
  }

  -- for dracula theme
  use 'ray-x/starry.nvim' 

  -- devicons
  use 'nvim-tree/nvim-web-devicons'

  use "lukas-reineke/indent-blankline.nvim"

  -- start screen
  use 'mhinz/vim-startify'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- tabline
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  use 'RRethy/vim-illuminate'
end)
