local map = vim.api.nvim_set_keymap
local lsp = require "lspconfig"
-- local coq = require "coq"
local util = require 'lspconfig.util'

require'lspconfig.configs'.regols = {
  default_config = {
    cmd = {'regols'};
    filetypes = { 'rego' };
    root_dir = util.root_pattern(".git");
  }
}

-- require'lspconfig.configs'.golangcilsp = {
--   default_config = {
--     filetypes = {'go'},
--     cmd = {'golangci-lint-langserver'},
--     root_dir = util.root_pattern('.git', 'go.mod'),
--     init_options = {
--       command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json" };
--     }
--   };
-- }
-- lsp.golangcilsp.setup {
--   capabilities = capabilities
-- }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
-- capabilities = coq.lsp_ensure_capabilities(capabilities)

require'lspconfig'.sorbet.setup{
  capabilities = capabilities
}
lsp.solargraph.setup{
  capabilities = capabilities;
--  cmd = { 'bundle', 'exec', 'solargraph', 'stdio' };
}
lsp.gopls.setup{
  capabilities = capabilities
}

lsp.eslint.setup{
  capabilities = capabilities
}

lsp.tsserver.setup{
  capabilities = capabilities
}

lsp.terraformls.setup{
  capabilities = capabilities
}

lsp.regols.setup{
  capabilities = capabilities
}

lsp.ccls.setup{
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
" autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()
autocmd CursorHold  * silent! lua vim.lsp.buf.document_highlight()
autocmd CursorHoldI * silent! lua vim.lsp.buf.document_highlight()
autocmd CursorMoved * silent! lua vim.lsp.buf.clear_references()

autocmd BufWritePre *.tsx EslintFixAll

autocmd BufWritePre *.tf lua vim.lsp.buf.format()
]]
-- <buffer> <cmd>EslintFixAll<CR>

map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<cr>', {noremap = true})
-- map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<cr>', {noremap = true})
map('n', 'gd', '<Cmd>Telescope lsp_definitions<cr>', {noremap = true})
--map('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<cr>', {noremap = true})
map('n', 'gi', '<Cmd>lua require("telescope.builtin").lsp_implementations{ sort_lastused=true }<cr>', {noremap = true})
map('n', 'gh', '<Cmd>lua vim.lsp.buf.signature_help()<cr>', {noremap = true})
map('n', 'gr', '<Cmd>lua vim.lsp.buf.rename()<cr>', {noremap = true})
map('n', '<leader>e', '<Cmd>lua vim.diagnostic.open_float()<cr>', {noremap = true})
map('n', 'af', '<Cmd>lua vim.lsp.buf.format { async = true }<cr>', {noremap = true})

map('n', 'ai', '<Cmd>lua vim.lsp.buf.code_action()<cr>', {noremap = true})

map('n', 'gw', '<Cmd>Telescope lsp_references<cr>', {noremap = true})

