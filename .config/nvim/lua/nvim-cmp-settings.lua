local cmp = require'cmp'
cmp.setup({
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<Tab>'] = function(fallback)
      local cmp = require('cmp')
      if #cmp.core:get_sources() > 0 and not cmp.get_config().experimental.native_menu then
        if cmp.visible() then
          cmp.select_next_item()
        else
          cmp.complete()
        end
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      local cmp = require('cmp')
      if #cmp.core:get_sources() > 0 and not cmp.get_config().experimental.native_menu then
        if cmp.visible() then
          cmp.select_prev_item()
        else
          cmp.complete()
        end
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp', max_item_count = 10 },
    { 
      name = 'buffer',
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      }
    },
    { name = 'path' },
  }
})

