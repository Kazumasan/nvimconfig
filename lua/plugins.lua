return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use {
    'shadmansaleh/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()  require("lualine").setup() end
  }

  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
  -- colorscheme
  use 'marko-cerovac/material.nvim'
  -- tree-sitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  -- lsp / lsp-install
  use {
    'neovim/nvim-lspconfig'
  }
  use {
    'kabouzeid/nvim-lspinstall'
  }
  -- Install nvim-cmp, buffer, cmp-lsp and LuaSnip + cmp-luasnip source as a dependency
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      {
        "L3MON4D3/LuaSnip",
        requires = {
          "rafamadriz/friendly-snippets"
        }
      },
      "hrsh7th/cmp-buffer",
      'hrsh7th/cmp-path',
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp"
    }
  }
  -- vim-kommentary
  use{
    'b3nj5m1n/kommentary'
  }
  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- autopairs
  use {
    'windwp/nvim-autopairs',
  }
  -- formatter
  use {
    'lukas-reineke/format.nvim'
  }
end)
