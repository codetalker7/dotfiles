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

  use({
    "glepnir/lspsaga.nvim",
    opt = true,
    branch = "main",
    event = "LspAttach",
    config = function()
        require("lspsaga").setup({})
    end,
    requires = {
        {"nvim-tree/nvim-web-devicons"},
        --Please make sure you install markdown and markdown_inline parser
        {"nvim-treesitter/nvim-treesitter"}
    }
  })
  
  --file explorer
  use 'nvim-tree/nvim-tree.lua'

  -- for dracula theme
  use 'ray-x/starry.nvim' 

  -- devicons
  use 'nvim-tree/nvim-web-devicons'

  -- config for nvim-treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
  }

  use "lukas-reineke/indent-blankline.nvim"

  -- start screen
  use 'mhinz/vim-startify'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons'},
  }

  -- tabline
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  use 'RRethy/vim-illuminate'

  use 'kosayoda/nvim-lightbulb'

  require('packer').use({
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  })

  use 'jpalardy/vim-slime'

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use 'ray-x/lsp_signature.nvim'
end)
