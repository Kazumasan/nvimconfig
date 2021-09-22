-- status line, lsp, colorscheme, barbar, telescope, maybe vim whichkey
-- installs  plugins
local plugins = require("plugins")
-- changes keymapping
--kommentary stuff
vim.g.kommentary_create_default_mappings  = false
local mappings = require("keys")
-- changes general behavior and sets vim variables
local general = require("general")
-- source plugin custom config
local line = require("lualineconf")
local tabbar = require("barbarconf")
local tree = require("treesitterconf")
local autopairs  = require("autopairsconf")
local cmp = require("cmpconf")
-- lsp
local lsp = require("lsp")

local pretty = require("formatter")
