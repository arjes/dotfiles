local enabled = false

local M = {
  "codota/tabnine-nvim",
  event = "InsertEnter",
  build= './dl_binaries.sh',
  enabled = enabled,
  -- version = "bdc60d9fbec793164f3f67c68bcec3f9ef9b18d7",
  dependencies = {
    -- This plugin must be loaded after nvim-cmp
    "hrsh7th/nvim-cmp",
  }
}

function M.config()
  local status_ok, tabnine_full_text = pcall(require, "tabnine")

  if not status_ok then 
    vim.notify("tabnine not found")
    return
  end

  tabnine_full_text.setup({
    disable_auto_comment=true,
    accept_keymap="<Tab>",
    debounce_ms = 300,
    suggestion_color = {gui = "#808080", cterm = 244}
  })
end

return M
