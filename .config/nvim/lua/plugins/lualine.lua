local M = {
 "hoob3rt/lualine.nvim",
 event = "VeryLazy",
 dependencies = {
   "selected_theme"
 }
}

function M.config()
  local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then
    vim.notify("lualine not found")
    return
  end
  lualine.setup {
    options = {
      theme = 'tokyonight',
    }
  }
end

return M
