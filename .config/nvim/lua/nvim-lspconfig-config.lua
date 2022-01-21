local map = vim.api.nvim_set_keymap

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require'lspconfig'.solargraph.setup{
  capabilities = capabilities
}
require'lspconfig'.gopls.setup{
  capabilities = capabilities
}

require'lspconfig'.eslint.setup{
  capabilities = capabilities
}

require'lspconfig'.tsserver.setup{
  capabilities = capabilities
}


vim.cmd [[
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" autocmd BufEnter * lua require'completion'.on_attach()
" autocmd CursorHold * silent lua vim.lsp.buf.hover()

autocmd BufWritePre *.tsx EslintFixAll

]]
-- <buffer> <cmd>EslintFixAll<CR>

-- map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<cr>', {noremap = true})
map('n', 'gd', '<Cmd>Telescope lsp_definitions<cr>', {noremap = true})
--map('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<cr>', {noremap = true})
map('n', 'gi', '<Cmd>Telescope lsp_implementations<cr>', {noremap = true})
map('n', 'gh', '<Cmd>lua vim.lsp.buf.signature_help()<cr>', {noremap = true})
map('n', 'gr', '<Cmd>lua vim.lsp.buf.rename()<cr>', {noremap = true})
map('n', '<leader>e', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', {noremap = true})
map('n', 'af', '<Cmd>lua vim.lsp.buf.formatting()<cr>', {noremap = true})

map('n', 'ai', '<Cmd>lua vim.lsp.buf.code_action()<cr>', {noremap = true})

map('n', 'gw', '<Cmd>Telescope lsp_references<cr>', {noremap = true})

