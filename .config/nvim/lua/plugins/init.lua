return {
  -- { 
  --   "projekt0n/github-nvim-theme", 
  --   name = "selected_theme",
  --   event = "VeryLazy",
  --   config = function()
  --     require('github-theme').setup()
  --   end,
  -- },
  { 
    "folke/tokyonight.nvim", 
    name = "selected_theme",
    config = function()
      vim.cmd[[colorscheme tokyonight-night]]
    end,
  },

  -- "ray-x/lsp_signature.nvim",
}
