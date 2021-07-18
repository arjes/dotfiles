vim.g.mapleader = ' ' 
local map = vim.api.nvim_set_keymap

map('i', 'jk', '<esc>', {noremap = true})
map('n', '<leader>evc', ':edit $MYVIMRC<CR>', {noremap = true})
map('n', '<leader>rvc', ':luafile $MYVIMRC<CR>', {noremap = true})
map('i', '<esc>', '<nop>', {noremap = true})

map('n', '<leader>u', ':MundoToggle<cr>', {noremap = true})

-- File Tree Navigation
map('n', '<leader>nt', ':NvimTreeToggle<cr>', {})
map('n', '<leader>fnt', ':NvimTreeFindFile<cr>', {})
map('n', '<leader>ff', ':Telescope find_files<cr>', {})
map('n', '<leader>fg', ':Telescope live_grep<cr>', {})

-- Copy to clipboard
map('v', '<leader>y', '"+y', {noremap = true})
map('n', '<leader>Y', '"+yg_', {noremap = true})
map('n', '<leader>y', '"+y', {noremap = true})
map('n', '<leader>yy', '"+yy', {noremap = true})

