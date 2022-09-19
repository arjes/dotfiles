require("neotest").setup({
  output = {
    enabled = true,
    open_on_run = "short"
  },
  adapters = {
    require("neotest-plenary"),
    require("neotest-go"),
    require("neotest-rspec"),
    require("neotest-vim-test")({
      ignore_file_types = { "ruby", "go" },
    }),
  },
})

-- The following block of code is from the GoLang testrunner readme
-- local neotest_ns = vim.api.nvim_create_namespace("neotest")
-- vim.diagnostic.config({
--   virtual_text = {
--     format = function(diagnostic)
--       local message = diagnostic.message
--         :gsub("\n", " ")
--         :gsub("\t", " ")
--         :gsub("%s+", " ")
--         :gsub("^%s+", "")
--       return message
--     end,
--   },
-- }, neotest_ns)


local map = vim.api.nvim_set_keymap;

map('n', '<leader>t', ":lua require('neotest').run.run()<CR>", {silent = true})
map('n', '<leader>ts', ":lua require('neotest').summary.open()<CR>", {silent = true})
map('n', '<leader>to', ":lua require('neotest').output.open()<CR>", {silent = true})
map('n', '<leader>T', ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", {silent = true})
map('n', '<leader>l', ":lua require('neotest').run.run_last()<CR>", {silent = true})

local augroup = vim.api.nvim_create_augroup 
local autocmd = vim.api.nvim_create_autocmd

augroup('AutoRunGroups', { clear = true })

autocmd('BufReadPost', {
  pattern = '*_spec.rb',
  group = 'AutoRunGroups',
  callback = function()
    require('neotest').run.run(vim.fn.expand('%'))
  end
})

autocmd('BufWritePost', {
  pattern = '*_spec.rb',
  group = 'AutoRunGroups',
  callback = function()
    require('neotest').run.run()
  end
})


-- Old vim-test config 
-- map('n', '<leader>t', ':TestNearest<CR>', {silent = true})
-- map('n', '<leader>T', ':TestFile<CR>', {silent = true})
-- map('n', '<leader>a', ':TestSuite<CR>', {silent = true})
-- map('n', '<leader>l', ':TestLast<CR>', {silent = true})
-- map('n', '<leader>g', ':TestVisit<CR>', {silent = true})
