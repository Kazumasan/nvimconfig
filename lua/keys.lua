local keymap = vim.api.nvim_set_keymap 
local opts = { noremap=true }
vim.g.mapleader = " "
keymap('i', 'jk', '<ESC>', opts)
keymap('n', '<Leader>w', ':w<CR>', opts)
keymap('n', '<Leader>q', ':wq!<CR>', opts)
keymap('n', '<Tab>', ':BufferNext<CR>', opts)
keymap('n', '<S-Tab>', ':BufferPrevious<CR>', opts)
keymap('n', '<Leader>h', ':noh<CR>', opts)
keymap('n', '<Leader>bc', ':BufferClose<CR>', opts)

