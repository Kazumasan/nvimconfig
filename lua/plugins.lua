local packer = require('packer')
local util = require("packer.util")
local join_paths = util.join_paths
local stdpath = vim.fn.stdpath
packer.init({
	package_root = join_paths(stdpath('config'), "pack"),
        snapshot_path = join_paths(stdpath('config'), "snapshots"),
})
packer.startup(function(use)
  use {"wbthomason/packer.nvim"}

  use {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup{
            palettes = {
              nightfox = {
                yellow = { 
                  base="#36BFA1",
                  dim="#288F79",
                  bright="#60D2B9"
                },
              },
            },
          }
    end
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
  use {
    'lewis6991/gitsigns.nvim', 
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() 
      require('gitsigns').setup() 
    end,
  }
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function ()
        return require("nvim-treesitter.configs").setup({
          ensure_installed = "maintained",
          highlight = {
            enable = true
          }
        })
      end
  }
  use{
    'williamboman/nvim-lsp-installer',
    requires = {
      'neovim/nvim-lspconfig',
      "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
      local lsp_install = require("nvim-lsp-installer")
      lsp_install.settings({
        install_root_dir = vim.fn.stdpath('config').."/lsp_servers"
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
      lsp_install.on_server_ready(function(server)
        opts = {
          capabilities = capabilities
        }
        server:setup(opts)
      end)
    end
  }
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      {
        "L3MON4D3/LuaSnip", -- setup keys correctly
        requires = {
          "rafamadriz/friendly-snippets"
        },
        config= function ()
          require("luasnip/loaders/from_vscode").load{
            include = {"javascript", "go"},
            path="~/.config/nvim/pack/packer/start/friendly-snippets"
          }
        end
      },
      "hrsh7th/cmp-buffer",
      'hrsh7th/cmp-path',
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
      require("completion_config")
    end
  }
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
  use {
    'windwp/nvim-autopairs',
    config = function ()
      require("nvim-autopairs").setup({
        disable_filetype = {"TelescopePrompt"}
      })
    end,
  }
  use {
    'mhartington/formatter.nvim',
    config = function ()
      require('formatter_config');
    end,
  }
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
  use {
    "AckslD/nvim-neoclip.lua",
      requires = {
        {'nvim-telescope/telescope.nvim'},
        {'tami5/sqlite.lua', module = 'sqlite'},
      },
      config = function()
        require('neoclip').setup({
          default_register = '+',
          eneable_persistent_history = true,
          db_path = vim.fn.stdpath("config").."/neoclip/yank.sqlite3",
          keys = {
            telescope = {
              i = {
                select = '<cr>',
                paste = '<c-p>',
                paste_behind = '<c-k>',
                replay = '<c-q>',  -- replay a macro
                delete = '<c-d>',  -- delete an entry
                custom = {},
              },
              n = {
                select = '<cr>',
                paste = 'p',
                paste_behind = 'P',
                replay = 'q',
                delete = 'd',
                custom = {},
              },
            }
          },
        })
        require("telescope").load_extension("neoclip")
      end,
  }
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
        opt = true,
      },
      config = function ()
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
  use{
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        size = function (term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
              return 20
          end
        end,
        open_mapping = [[<C-O>]],
        hide_numbers = true,
        shade_factor = 2,
        start_in_insert = true,
        insert_mapping = false,
        terminal_mapping = true,
        persistent_size = true,
        direction = "horizontal",
        close_on_exit = false,
      })
    end
  }
  use {
    "luukvbaal/stabilize.nvim",
    config = function() require("stabilize").setup() end
  }
  use {
    'ggandor/lightspeed.nvim'
  }
end)
