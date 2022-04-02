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
vim.opt.scl = "yes"
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 10

-- clipboard
vim.opt.clipboard = "unnamedplus"

--colorscheme
vim.g.termguicolor = true

-- virtual_text
vim.diagnostic.config({
  virtual_text = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
