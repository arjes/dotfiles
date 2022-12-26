local status_ok, chatgpt = pcall(require, "chatgpt")
if not status_ok then
  vim.notify("chatgpt not found")
  return
end

chatgpt.setup({
  -- optional configuration
})
