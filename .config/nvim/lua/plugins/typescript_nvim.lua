local M = {
  enabled = false,
  lazy = false,
  "pmizio/typescript-tools.nvim",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {},
  -- ft = {
  --   'typescript',
  --   'typescriptreact',
  --   'typescript.tsx',
  --   'javascript',
  --   'javascriptreact',
  --   'javascript.jsx',
  -- },
}

function M.config()
  require("typescript-tools").setup { }
end

return M
