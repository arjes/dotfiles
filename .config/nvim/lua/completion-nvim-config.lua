vim.g.completion_chain_complete_list = {
  default = {
    { complete_items = { 'lsp'; 'buffers'; 'path';} },
    { mode = { '<c-p>' } },
    { mode = { '<c-n>' } }
  },
}

