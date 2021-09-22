local keymap = vim.api.nvim_set_keymap
local telescope = require("telescope")
local opts = { noremap=true }


vim.g.mapleader = " "
keymap('i', 'jk', '<ESC>', opts) --i hate esc
-- keymap('v', 'jk', '<ESC>', opts) --i hate esc
keymap('n', '<Leader>w', ':w<CR>', opts) -- i hate :w
keymap('n', '<Leader>q', ':q!<CR>', opts) -- i hate :q
keymap('n', '<Tab>', ':BufferNext<CR>', opts) -- tab for navigating buffers maybe removed because tabout
keymap('n', '<S-Tab>', ':BufferPrevious<CR>', opts) -- ""
keymap('n', '<Leader>h', ':noh<CR>', opts) -- turn off search hilighting
keymap('n', '<Leader>bc', ':BufferClose!<CR>', opts) -- convinient buffer close

-- better tabbing
keymap('n', '<<', '>>', opts)
keymap('n', '>>', '<<', opts)
keymap('v', '<', '>', opts)
keymap('v', '>', '<', opts)
--formatter
keymap('n', '<Leader>f', ':Format<CR>', opts)

-- vim-kommentary
keymap("n", "#", "<Plug>kommentary_line_default", {})
keymap("n", "<Leader>#", "<Plug>kommentary_motion_default", {})
keymap("v", "#", "<Plug>kommentary_visual_default", {})

-- telescope
keymap("n", "<Leader>t",":Telescope find_files<CR>", {}) 
