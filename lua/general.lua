-- general behaviour
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.cursorline = true
vim.opt.autoindent = true
vim.opt.hidden = true
vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.showmode = false
vim.opt.wrap = false
vim.opt.laststatus = 2
-- clipboard
vim.opt.clipboard = "unnamedplus"

--colorscheme
vim.g.termguicolor = true
vim.cmd([[
colorscheme material
]])
vim.g.material_style = "deep ocean"
