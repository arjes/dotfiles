local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  vim.notify("nvim-cmp not found")
  return
end

-- VSnip must be required for cmp to work
require 'plugins.config.nvim-vsnip'

local icons = require 'settings.icons'

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
    ['<esc>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = function(fallback)
      local cmp = require('cmp')
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      local cmp = require('cmp')
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  -- formatting = {
  --   fields = {"abbr", "kind", "menu" },
  --   format = function(entry, vim_item)

  --     if entry.source.name == "cmp_tabnine" then
  --       vim_item.kind = icons.tools.Tabnine
  --       vim_item.kind_hl_group = "CmpItemKindTabnine"
  --     end
  --     
  --     if entry.source.name == "copilot" then
  --       vim_item.kind = icons.tools.Copilot
  --       vim_item.kind_hl_group = "CmpItemKindCopilot"
  --     end

  --     -- NOTE: order matters
  --     -- vim_item.menu = ({
  --     --   nvim_lsp = "",
  --     --   nvim_lua = "",
  --     --   luasnip = "",
  --     --   buffer = "",
  --     --   path = "",
  --     --   emoji = "",
  --     -- })[entry.source.name]
  --     return vim_item
  --   end,
  },
  sources = {
    { name = 'nvim_lsp', max_item_count = 10, group_index =3 },
    { 
      name = 'cmp_tabnine',
      group_index = 2,
      trigger_characters = {
        ".",
        ":",
        "(",
        "'",
        '"',
        "[",
        ",",
        "#",
        "*",
        "@",
        "|",
        "=",
        "-",
        "{",
        "/",
        "\\",
        "+",
        "?",
        " ",
        -- "\t",
        "\n",
      },
    },
    { 
      name = "copilot",
      group_index = 2,
      trigger_characters = {
        ".",
        ":",
        "(",
        "'",
        '"',
        "[",
        ",",
        "#",
        "*",
        "@",
        "|",
        "=",
        "-",
        "{",
        "/",
        "\\",
        "+",
        "?",
        " ",
        -- "\t",
        -- "\n",
      },
    },
    { name = 'vsnip', group_index = 4 },
    { 
      name = 'buffer',
      group_index = 3,
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      }
    },
    -- { name = 'neorg' },
    { name = 'path', group_index = 4},
  }
})

