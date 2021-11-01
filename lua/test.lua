require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- colorscheme
  use {'marko-cerovac/material.nvim'}
  --status line
  use { 'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require("lualine").setup({
        options = {
          theme = "iceberg_dark"
        }
      })
    end
  }
  --tabbar
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function ()
      require("barbarconf")
    end
  }
  -- signcolums population 
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- lsp stuff
 use{
    'kabouzeid/nvim-lspinstall'
  }
  use {
    'neovim/nvim-lspconfig',
    config = function ()
      require("lsp")
    end
  } 
  -- tree-sitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function ()
        require("treesitterconf")
      end
  }
  -- cmp
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
    },
    config = require("cmpconf")
  }
end)
