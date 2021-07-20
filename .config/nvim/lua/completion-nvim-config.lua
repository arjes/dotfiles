vim.g.completion_auto_change_source = 1
vim.g.completion_chain_complete_list = {
  default = {
    { complete_items = { 'lsp'; } },
    { complete_items = { 'buffers'; } },
    { complete_items = { 'path'; } },
    { mode = { '<c-p>' } },
    { mode = { '<c-n>' } }
  },
  TelescopePrompt = {
    { complete_items = {} },
    { mode = { '<c-p>' } },
    { mode = { '<c-n>' } }
  },
}

