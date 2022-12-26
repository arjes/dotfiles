
require "paq" {
    "savq/paq-nvim";
    "kyazdani42/nvim-web-devicons";
    "kyazdani42/nvim-tree.lua";
   
    "MunifTanjim/nui.nvim";

    -- "scrooloose/nerdtree";
    "hoob3rt/lualine.nvim";
    "projekt0n/github-nvim-theme";

    -- Telescope Deps
    -- "nvim-lua/popup.nvim";
    { "nvim-lua/plenary.nvim" };
    { "nvim-telescope/telescope.nvim" };
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      run='make'
    };

    -- "justinmk/vim-sneak";
    {
      "nvim-treesitter/nvim-treesitter",
      run=function() vim.cmd ':TSUpdate' end
    };
    "RRethy/nvim-treesitter-endwise";
    "nvim-treesitter/nvim-treesitter-context";
   "nvim-treesitter/playground";
   "nvim-treesitter/nvim-treesitter-textobjects";

    "neovim/nvim-lspconfig";
    -- "jose-elias-alvarez/null-ls.nvim";
    "ray-x/lsp_signature.nvim";

    -- Fast but the author keeps pushing bugs :/
    -- { "ms-jpq/coq_nvim", branch="coq" };


   "hrsh7th/nvim-cmp";
   "hrsh7th/cmp-buffer";
   "hrsh7th/cmp-nvim-lsp";
   "hrsh7th/cmp-path";
   "hrsh7th/cmp-vsnip";
   "hrsh7th/vim-vsnip";

    -- AI Helpers
    {
      "tzachar/cmp-tabnine",
      run='./install.sh'
    };
    {"codota/tabnine-nvim", run = './dl_binaries.sh'};  -- Maybe provides natural language
    "zbirenbaum/copilot.lua";
    "zbirenbaum/copilot-cmp";
    "jackMort/ChatGPT.nvim"; -- requires = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" }
  
    --

    -- "tpope/vim-surround";
    "kylechui/nvim-surround";
    "simnalamburt/vim-mundo";

    -- Fallback
    { "bmalinconico/vim-test", branch="enable_auto_continue" };

    "nvim-neotest/neotest";
    "nvim-neotest/neotest-plenary";
    "olimorris/neotest-rspec";
    "nvim-neotest/neotest-go";
    "nvim-neotest/neotest-vim-test";
    "antoinemadec/FixCursorHold.nvim";

    "lewis6991/gitsigns.nvim";

    -- Highlights a unique word on each line
    --"unblevable/quick-scope";
    "ggandor/leap.nvim";

    "junegunn/vim-easy-align";
    "tpope/vim-fugitive";

    "fatih/vim-go";
    "sebdah/vim-delve";

    -- {"bmalinconico/neorg", branch="work_without_cd"};
}

require 'plugins.config.chatgpt'
require 'plugins.config.copilot'
require 'plugins.config.gitsigns'
require 'plugins.config.lualine'
require 'plugins.config.neotest'
require 'plugins.config.nvim-cmp'
require 'plugins.config.nvim-lspconfig'
require 'plugins.config.nvim-surround'
require 'plugins.config.nvim-treesitter'
require 'plugins.config.nvim-treesitter-textobjects'
require 'plugins.config.nvim-vsnip'
require 'plugins.config.tabnine'
require 'plugins.config.telescope'
require 'plugins.config.leap'
require 'plugins.config.lsp-signature'
