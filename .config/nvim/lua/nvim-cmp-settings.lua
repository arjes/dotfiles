local cmp = require'cmp'
cmp.setup({
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
  },
  buffer = {
    get_bufnrs = function()
      return vim.api.nvim_list_bufs()
    end
  },
  sources = {
    { name = 'nvim_lsp', max_item_count = 10 },
    { name = 'buffer' },
    { name = 'path' },
  }
})

