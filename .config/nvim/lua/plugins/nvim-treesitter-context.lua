local M = {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = {
    "nvim-treesitter/nvim-treesitter"
  }
}

function M.config()
  require'treesitter-context'.setup()
end

return M
