return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- colorscheme
  use {'marko-cerovac/material.nvim'}
  -- status line
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
  -- Use dependency and run lua function after load
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
  -- tree-sitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function ()
        require("treesitterconf")
      end
  }
  -- lsp / lsp-install
  use{
    'kabouzeid/nvim-lspinstall'
  }
  use {
    'neovim/nvim-lspconfig',
    config = function ()
      require("lsp")
    end
  }
  -- Install nvim-cmp, buffer, cmp-lsp and LuaSnip + cmp-luasnip source as  a dependency
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      {
        "L3MON4D3/LuaSnip",
        requires = {
          "rafamadriz/friendly-snippets"
        },
        config= function ()
          require("luasnip/loaders/from_vscode").load{
            include = {"javascript"},
            path="~/.local/share/nvim/site/pack/packer/start/friendly-snippets"
          }
        end
      },
      "hrsh7th/cmp-buffer",
      'hrsh7th/cmp-path',
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
      require("cmpconf")
    end
  }
  -- vim-kommentary
  use{
    'b3nj5m1n/kommentary',
    config = function ()
      vim.g.kommentary_create_default_mappings = false
      require('kommentary.config').configure_language("default", {
        single_line_comment_string = "//",
        multi_line_comment_string = {"/*", "*/"},
        prefer_single_line_comments = true,
        use_consistent_indentation = true,
        ignore_whitespace = true,
      })
    end
  }
  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  --nvim-tree
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
        opt = true,
      },
      config = function ()
        --set close_on_open in init before this plugin is setup
        require("nvim-tree").setup({
          disable_netrw = true,
          auto_close = false,
          open_on_tab = true,
        })
      end
  }
  -- autopairs
  use {
    'windwp/nvim-autopairs',
    config = function ()
      require("nvim-autopairs").setup({
        disable_filetype = {"TelescopePrompt"}
      })
    end,
  }
  -- formatter
  use {
    'mhartington/formatter.nvim',
    config = function ()
      require('pretty');
    end,
  }
  -- Tabout
  -- use {
  --   'abecodes/tabout.nvim',
  --   config = function()
  --     require("taboutconf")
  --   end,
  --   wants = {'nvim-treesitter'}, -- or require if not used so far
  --   after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
  -- }
  use {
    "luukvbaal/stabilize.nvim",
    config = function() require("stabilize").setup() end
  }
end)
