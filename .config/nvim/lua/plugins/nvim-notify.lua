local M = {
  "rcarriga/nvim-notify",
  keys = {
    { "<leader>jk", "<cmd>lua require'notify'.dismiss()<cr>", desc = "Clear notifications" },
  },
}

function M.config()
  vim.notify = require("notify")
end

return M
