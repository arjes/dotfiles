return {
  { 
    "projekt0n/github-nvim-theme", 
    event = "VeryLazy",
    config = function()
      vim.notify("Loading the theme")
      require('github-theme').setup()
    end,
  },

  "hoob3rt/lualine.nvim",

  -- Telescope Deps
  -- "nvim-lua/popup.nvim",
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build='make'
  },

  "RRethy/nvim-treesitter-endwise",
  "nvim-treesitter/nvim-treesitter-context",
  "nvim-treesitter/nvim-treesitter-textobjects",

  "neovim/nvim-lspconfig",
  -- "jose-elias-alvarez/null-ls.nvim",
  "ray-x/lsp_signature.nvim",

  -- AI Helpers
  {
    "tzachar/cmp-tabnine",
    build='./install.sh'
  },
  {"codota/tabnine-nvim", build= './dl_binaries.sh'},  -- Maybe provides natural language
  "zbirenbaum/copilot.lua",
  "zbirenbaum/copilot-cmp",

  { 
    "jackMort/ChatGPT.nvim", 
    dependencies= {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim"
    }
  }

  "simnalamburt/vim-mundo",

  -- Fallback
  { "bmalinconico/vim-test", branch="enable_auto_continue" },

  "lewis6991/gitsigns.nvim",

  -- Highlights a unique word on each line
  --"unblevable/quick-scope",
  "ggandor/leap.nvim",

  "junegunn/vim-easy-align",
  "tpope/vim-fugitive",

  "fatih/vim-go",
  "sebdah/vim-delve",

  -- {"bmalinconico/neorg", branch="work_without_cd"},
}
