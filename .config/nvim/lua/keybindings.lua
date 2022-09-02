vim.g.mapleader = ' ' 
vim.g.maplocalleader = ' ' 
local map = vim.api.nvim_set_keymap

map('i', 'jk', '<esc>', {noremap = true})
map('n', '<leader>evc', ':edit $MYVIMRC<CR>', {noremap = true})
map('n', '<leader>rvc', ':luafile $MYVIMRC<CR>', {noremap = true})
map('i', '<esc>', '<nop>', {noremap = true})

map('n', '<leader>u', ':MundoToggle<cr>', {noremap = true})

-- File Tree Navigation
map('n', '<leader>nt', ':NERDTreeToggle<cr>', {})
map('n', '<leader>fnt', ':NERDTreeFind<cr>', {})
map('n', '<leader>ff', ':Telescope find_files<cr>', {})
map('n', '<leader>fg', ':Telescope live_grep<cr>', {})
map('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers{ sort_lastused=true }<cr>", {})
map('n', '<leader>fw', ':Telescope grep_string<cr>', {})
map('n', '<leader>fr', ':Telescope resume<cr>', {})

-- Copy to clipboard
map('v', '<leader>y', '"+y', {noremap = true})
map('n', '<leader>Y', '"+yg_', {noremap = true})
map('n', '<leader>y', '"+y', {noremap = true})
map('n', '<leader>yy', '"+yy', {noremap = true})

map('n', '<leader>r', ':set opfunc=ChangePaste<CR>g@', {silent=true})


map('n', '<leader>t', ':TestNearest<CR>', {silent = true})
map('n', '<leader>T', ':TestFile<CR>', {silent = true})
map('n', '<leader>a', ':TestSuite<CR>', {silent = true})
map('n', '<leader>l', ':TestLast<CR>', {silent = true})
map('n', '<leader>g', ':TestVisit<CR>', {silent = true})

vim.cmd [[
let test#strategy = "neovim"

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! \"0p"
endfunction

augroup autoDebugger
  autocmd!
  " Ruby
  autocmd FileType ruby noremap <leader>d Obinding.pry<esc>==
  "autocmd FileType ruby inoremap <leader>d <esc>Obinding.pry<esc>==i
  "autocmd FileType ruby iabbrev <buffer> binding TRYAGAIN

  autocmd FileType ruby nnoremap <leader>pd yiwOputs <esc>p
  "autocmd FileType ruby inoremap <leader>pd <esc>yiwOputs <esc>p

  "typescript
  autocmd FileType typescript noremap <leader>d Odebugger;<esc>==
"  autocmd FileType typescript inoremap <leader>d <esc>Odebugger;<esc>==i
  autocmd FileType typescript iabbrev <buffer> debugger TRYAGAIN

  autocmd FileType typescript nnoremap <leader>pd yiwOconsole.log(<esc>pA)
"  autocmd FileType typescript inoremap <leader>pd <esc>yiwOconsole.log(<esc>pA)
augroup END
]]

