local M = {
  "RRethy/nvim-treesitter-endwise",
  event = "InsertEnter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter"
  }
}

function M.config()
  require('nvim-treesitter.configs').setup {
    endwise = {
      enable = true,
    },
  }
end

return M
