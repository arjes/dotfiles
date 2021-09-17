vim.g.coq_settings = { 
  auto_start = true,
  limits = {
    -- The default value is 0.088 which is apparently too fast for gopls
    completion_auto_timeout = 1,
  }
}
