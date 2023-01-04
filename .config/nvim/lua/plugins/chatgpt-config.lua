local enabled = false

local M = {
  "jackMort/ChatGPT.nvim", 
  enabled = enabled,
  -- cmd = {
  --   "ChatGPT",
  --   "ChatGPTActAs",
  --   "ChatGPTEditWithInstructions",
  -- },
  dependencies= {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim"
  }
}

function M.config()
  local status_ok, chatgpt = pcall(require, "chatgpt")
  if not status_ok then
    vim.notify("chatgpt not found")
    return
  end

  chatgpt.setup({
    -- optional configuration
  })
end

return M
