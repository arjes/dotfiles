local M = {
  "nvim-neotest/neotest",
  event = {
    'BufReadPre *_spec.rb,*_test.go',
    'BufWritePre *_spec.rb,*_test.go',
  },
  keys = {
    { '<leader>t', "<cmd>lua require('neotest').run.run()<CR>", {silent = true} },
    { '<leader>ta', "<cmd>lua require('neotest').run.attach()<CR>", {silent = true} },
    { '<leader>ts', "<cmd>lua require('neotest').summary.toggle()<CR>", {silent = true} },
    { '<leader>to', "<cmd>lua require('neotest').output.open()<CR>", {silent = true} },
    { '<leader>T', "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", {silent = true} },
    { '<leader>l', "<cmd>lua require('neotest').run.run_last()<CR>", {silent = true} },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-neotest/neotest-plenary",
    "olimorris/neotest-rspec",
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-vim-test",
    "antoinemadec/FixCursorHold.nvim",
  }
}

function M.config()
  local status_ok, neotest = pcall(require, "neotest")
  if not status_ok then
    vim.notify("neotest not found")
    return
  end

  neotest.setup({
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
end

return M
