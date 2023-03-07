local augroup = vim.api.nvim_create_augroup 


local group = augroup('Golang', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  group = group,
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
    vim.lsp.buf.format { async = false }
  end
})
