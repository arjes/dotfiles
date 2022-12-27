local M = {
 "neovim/nvim-lspconfig",
 event = "BufReadPre",
 keys = {
  -- map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<cr>', {noremap = true})
  --map('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<cr>', {noremap = true})
  { 'K', '<Cmd>lua vim.lsp.buf.hover()<cr>', {noremap = true} },
  { 'gd', '<Cmd>Telescope lsp_definitions<cr>', {noremap = true} },
  { 'gi', '<Cmd>lua require("telescope.builtin").lsp_implementations{ sort_lastused=true }<cr>', {noremap = true} },
  { 'gh', '<Cmd>lua vim.lsp.buf.signature_help()<cr>', {noremap = true} },
  { 'gr', '<Cmd>lua vim.lsp.buf.rename()<cr>', {noremap = true} },
  { '<leader>e', '<Cmd>lua vim.diagnostic.open_float()<cr>', {noremap = true} },
  { 'af', '<Cmd>lua vim.lsp.buf.format { async = true }<cr>', {noremap = true} },
  { 'ai', '<Cmd>lua vim.lsp.buf.code_action()<cr>', {noremap = true} },
  { 'gw', '<Cmd>Telescope lsp_references<cr>', {noremap = true} },
 },
 dependencies = {
   "hrsh7th/cmp-nvim-lsp",
 }
}

function M.config()
  local status_ok, lsp = pcall(require, "lspconfig")
  if not status_ok then
    vim.notify("lspconfig not found")
    return
  end

  local map = vim.api.nvim_set_keymap
  -- local coq = require "coq"
  local util = require 'lspconfig.util'

  require'lspconfig.configs'.regols = {
    default_config = {
      cmd = {'regols'};
      filetypes = { 'rego' };
      root_dir = util.root_pattern(".git");
    }
  }

  local capabilities = vim.lsp.protocol.make_client_capabilities()

  local status_ok, cmpnvimlsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    capabilities = cmpnvimlsp.default_capabilities(capabilities)
  end

  local servers = {
    sorbet = {},
    gopls = {},
    eslint = {},
    tsserver = {},
    terraformls = {},
    regols = {},
    ccls = {},
    -- solargraph = {
    --   capabilities = capabilities,
    --   cmd = { 'bundle', 'exec', 'solargraph', 'stdio' },
    -- }
  }

  local options = {
    -- on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }

  for server, opts in pairs(servers) do
    opts = vim.tbl_deep_extend("force", {}, options, opts or {})
    require("lspconfig")[server].setup(opts)
  end

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

end

return M
