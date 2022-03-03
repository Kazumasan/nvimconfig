keymap = vim.api.nvim_set_keymap
opts = { noremap=true }


vim.g.mapleader = " "
keymap('i', 'jk', '<ESC>', opts) --i hate esc
keymap('i', 'JK', '<ESC>', opts) --i hate esc
-- keymap('v', 'jk', '<ESC>', opts) --i hate esc
keymap('n', '<Leader>w', ':w<CR>', opts) -- i hate :w
-- keymap('n', '<Leader>q', ':q!<CR>', opts) -- i hate :q
keymap('n', 'ö', '}', opts)
keymap('n', 'ä', '{', opts)
keymap('n', '<c-k>', ':BufferNext<CR>', opts)
keymap('n', '<c-j>', ':BufferPrevious<CR>', opts) -- ""
keymap('n', '<Leader>s', ':BufferPick<CR>', opts)
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

--nvimtree
keymap("n", "<Leader>o", ":NvimTreeToggle<CR>", opts)




