return {
  { 
    "projekt0n/github-nvim-theme", 
    name = "selected_theme",
    event = "VeryLazy",
    config = function()
      vim.notify("Loading the theme")
      require('github-theme').setup()
    end,
  },

  -- "ray-x/lsp_signature.nvim",
}
