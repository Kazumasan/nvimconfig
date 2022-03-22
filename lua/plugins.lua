return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- colorschemes
  use {
    'marko-cerovac/material.nvim',
    config = require("material").setup{
        lualine_style = "stealth",
      }
  }
  use {
    "EdenEast/nightfox.nvim",
    config = require("nightfox").setup{
      pallets = {
        nightfox = {
          -- yellow = { base="#36BFA1", dim="#288F79", bright="#60D2B9"},
        },
      }
    }
  }
  use {
    "sainnhe/sonokai"
  }
  -- status line
  use { 'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require("lualine").setup({
        options = {
          theme = "nightfox"
        }
      })
    end
  }
  --tabbar
  -- use {
  --   'romgrk/barbar.nvim',
  --   requires = {'kyazdani42/nvim-web-devicons'},
  --   config = function ()
  --     require("barbarconf")
  --   end
  -- }
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config=function ()
     require("bufferline").setup{
      mode= buffers,
      close_command = "bdelete!",
      indicator_line = "|",
      modified_icon = "●",
      offsets = {filetype = "NvimTree", text = "File Explorer" },
      show_buffer_icons = true,
      show_close_icon = false,
      show_buffer_close_icons = false,
      show_tab_indicator = true,
      seperator_style = "thin",
      always_show_buffer_line = true,
      sort_by = "relative_directory"
     }
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
  -- lsp / lsp-installer
  use{
    'williamboman/nvim-lsp-installer',
    'neovim/nvim-lspconfig',
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
            include = {"javascript", "go"},
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
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require('telescope').setup{
        defaults = {
          file_ignore_patterns = {"node_modules/", ".git/"}
        }
      }
    end
  }
  -- movement Plugins
  use {
    'ggandor/lightspeed.nvim'
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
          actions = {
            open_file = {
              quit_on_open = true;
            }
          },
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
