
local M = {
  enabled = true,
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
}

function M.config()
  vim.defer_fn(function()

    local status_ok, copilot = pcall(require, "copilot")
    if not status_ok then
      vim.notify("copilot not found")
    else
      copilot.setup({
        suggestion = {
          eabled = true,
          auto_trigger = true,
        }
      })
    end

  end, 100)
end

return M
