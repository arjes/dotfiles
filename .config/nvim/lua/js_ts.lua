local augroup = vim.api.nvim_create_augroup 


local group = augroup('Typescript', { clear = true })


-- local executeSync = function(cmd)
--     -- gets the current bufnr if no bufnr is passed
--     local bufnr = vim.api.nvim_get_current_buf()
-- 
--     -- params for the request
--     local params = {
--         command = cmd, -- "_typescript.organizeImports",
--         arguments = {vim.api.nvim_buf_get_name(bufnr)},
--         title = ""
--     }
-- 
-- 
-- 
--     vim.lsp.buf_request_sync(1, "workspace/executeCommand", {command ="OrganizeImports", arguments = {"/Users/brianmalinconico/workspace/frontend/app/apps/data-studio/src/app/layouts/main-layout/main-layout.component.ts"}, title =""}, 500)
--     -- perform a syncronous request
--     -- 500ms timeout depending on the size of file a bigger timeout may be needed
--     vim.lsp.buf_request_sync(bufnr, "workspace/executeCommand", params, 500)
-- end

-- local api = require("typescript-tools.api")
-- local c = require("typescript-tools.protocol.constants")

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.ts',
  group = group,
  callback = function()
    -- require("typescript").actions.addMissingImports({ sync = true })
    -- vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
    
    vim.lsp.buf.format { async = false }

    -- executeSync('_typescript.addMissingImports')
    -- executeSync('_typescript.removeUnusedImports')
    --executeSync('_typescript.organizeImports')

    -- vim.lsp.buf.code_action({ context = { only = { 'source.addMissingImports', } }, apply = true })
    -- vim.lsp.buf.code_action({ context = { only = { 'source.removeUnusedImports', } }, apply = true })
    --vim.lsp.buf.code_action({ context = { only = { 'source.addMissingImports', } }, apply = true })

    -- api.add_missing_imports()
    -- api.organize_imports(c.OrganizeImportsMode.All)
  end
})
