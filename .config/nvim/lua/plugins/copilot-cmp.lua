local M = {
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  dependencies = {
    "zbirenbaum/copilot.lua"
  }
}

function M.config()
  vim.defer_fn(function()

    local status_ok, copilot = pcall(require, "copilot")
    if not status_ok then
      vim.notify("copilot not found")
    else
      copilot.setup({
        suggestion = {
          auto_trigger = false,
        }
      })

      local status_ok, copilot_cmp = pcall(require, "copilot_cmp")
      if not status_ok then
        vim.notify("copilot_cmp not found")
      else
        copilot_cmp.setup()
      end
    end

  end, 100)
end

return M
