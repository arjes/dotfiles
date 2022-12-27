local M = {
  "tzachar/cmp-tabnine",
  build='./install.sh',
  event = "InsertEnter",
}

function M.config()
  local status_ok, tabnine = pcall(require, "cmp_tabnine.config")

  if not status_ok then
    vim.notify("cmp-tabnine not found")
    return
  end
  -- This plugin integrates with vim-cmp
  tabnine:setup({
    max_lines = 1000,
    max_num_results = 20,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = '..',
    ignored_file_types = {
      -- default is not to ignore
      -- uncomment to ignore in lua:
      -- lua = true
    },
    show_prediction_strength = false
  })


  local prefetch = vim.api.nvim_create_augroup("prefetch", {clear = true})

  vim.api.nvim_create_autocmd('BufRead', {
    group = prefetch,
    pattern = { '*.rb', '*.go' },
    callback = function()
      require('cmp_tabnine'):prefetch(vim.fn.expand('%:p'))
    end
  })

end

return M
