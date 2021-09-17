local cmp = require'cmp'
cmp.setup({
  -- mapping = {
  --   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  -- },
  buffer = {
    get_bufnrs = function()
      return vim.api.nvim_list_bufs()
    end
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  }
})

