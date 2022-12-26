local status_ok, lsp_signature = pcall(require, "lsp_signature")
if not status_ok then
  vim.notify("lsp_signature not found")
  return
end
-- local current_signature = function()
--   if not pcall(require, 'lsp_signature') then return end
--   local sig = require("lsp_signature").status_line(150)
--   if not sig.hint == "" then
--     return sig.label .. "[" .. sig.hint .. "]"
--   else
--     return sig.label
--   end
-- end
--
-- require('lualine').setup {
--   options = {
--     theme = 'auto',
--   },
--   sections = { 
--      lualine_c = {'filename', current_signature} 
--   }
-- }
--
cfg = {
  zindex = 50,
  floating_window = false
}
require "lsp_signature".setup(cfg)

