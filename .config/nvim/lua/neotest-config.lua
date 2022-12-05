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
map('n', '<leader>ta', ":lua require('neotest').run.attach()<CR>", {silent = true})
map('n', '<leader>ts', ":lua require('neotest').summary.toggle()<CR>", {silent = true})
map('n', '<leader>to', ":lua require('neotest').output.open()<CR>", {silent = true})
map('n', '<leader>T', ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", {silent = true})
map('n', '<leader>l', ":lua require('neotest').run.run_last()<CR>", {silent = true})

local augroup = vim.api.nvim_create_augroup 
local autocmd = vim.api.nvim_create_autocmd

local group = augroup('NeotestAuGroup', { clear = true })

autocmd('BufReadPost', {
  pattern = '*_spec.rb',
  group = group,
  callback = function()
    require('neotest').run.run(vim.fn.expand('%'))
  end
})

autocmd('BufWritePost', {
  pattern = '*_spec.rb',
  group = group,
  callback = function()
    require('neotest').run.run()
  end
})

autocmd("FileType", {
  pattern = "neotest-output,neotest-attach",
  group = group,
  callback = function(opts)
    -- Allow simple Q to quit the window
    vim.keymap.set("n", "q", function()
      pcall(vim.api.nvim_win_close, 0, true)
    end, {
        buffer = opts.buf,
      })

    -- Use my normal jk to get out of the terminal insert mode
    vim.keymap.set("t", "jk", '<C-\\><C-n>', { buffer = opts.buf})

  end,
})



-- Old vim-test config 
-- map('n', '<leader>t', ':TestNearest<CR>', {silent = true})
-- map('n', '<leader>T', ':TestFile<CR>', {silent = true})
-- map('n', '<leader>a', ':TestSuite<CR>', {silent = true})
-- map('n', '<leader>l', ':TestLast<CR>', {silent = true})
-- map('n', '<leader>g', ':TestVisit<CR>', {silent = true})
