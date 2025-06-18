
local M = {
  "olimorris/codecompanion.nvim",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}

function M.config()
  local status_ok, codecompanion = pcall(require, "codecompanion")

  if not status_ok then
    vim.notify("codecompanion not found")
    return
  end

  codecompanion.setup()

end

return M
