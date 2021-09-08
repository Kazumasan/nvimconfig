-- status line, lsp, colorscheme, barbar, telescope, maybe vim whichkey
-- installs  plugins
local plugins = require("plugins")
-- changes keymapping
local mappings = require("keys")
-- changes general behavior and sets vim variables
local general = require("general")
-- source plugin custom config
local line = require("lualineconf")
local tabbar = require("barbarconf")
local tree = require("treesitterconf")
local cmp = require("cmpconf")
-- lsp
local lsp = require("lsp")
