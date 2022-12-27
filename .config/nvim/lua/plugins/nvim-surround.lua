local M = {
  "kylechui/nvim-surround"
}

function M.config()
  local status_ok, nvim_surround = pcall(require, "nvim-surround")
  if not status_ok then
    vim.notify("nvim-surround not found")
    return
  end

  nvim_surround.setup {
  }
end

return M
