local M = {
  "lewis6991/gitsigns.nvim",
}

function M.config()
  local status_ok, gitsigns = pcall(require, "gitsigns")
  if not status_ok then
    vim.notify("gitsigns not found")
    return
  end

  gitsigns.setup()
end


return M
