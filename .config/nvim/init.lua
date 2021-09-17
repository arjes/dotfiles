 ----- Directories {{{
vim.opt.directory="~/.vim/swap,/tmp"
vim.opt.undofile=true
vim.opt.backupdir="~/.vim/backup,/tmp"
vim.opt.undodir="~/.vim/undo,/tmp"
----- }}}

-- Plugins {{{
require "paq" {
    "savq/paq-nvim";
    -- "kyazdani42/nvim-web-devicons";
    -- "kyazdani42/nvim-tree.lua";
    "scrooloose/nerdtree";
    "hoob3rt/lualine.nvim";
    "projekt0n/github-nvim-theme";

    -- Telescope Deps
    -- "nvim-lua/popup.nvim";
    { "nvim-lua/plenary.nvim" };
    { "nvim-telescope/telescope.nvim" };

    -- "justinmk/vim-sneak";
    {
      "nvim-treesitter/nvim-treesitter",
      run=function() vim.cmd ':TSUpdate' end
    };

    "neovim/nvim-lspconfig";

    -- Fast but the author keeps pushing bugs :/
    --{ "ms-jpq/coq_nvim", branch="coq" };
    "hrsh7th/nvim-cmp";
    "hrsh7th/cmp-buffer";
    "hrsh7th/cmp-nvim-lsp";
    "hrsh7th/cmp-path";

    "tpope/vim-surround";
    "simnalamburt/vim-mundo";

    "janko-m/vim-test";
    "lewis6991/gitsigns.nvim";
    "unblevable/quick-scope";
    "junegunn/vim-easy-align";
    "tpope/vim-fugitive";
}

-- General Config For All Buffers
require('settings')

-- Global Key Bindings
require('keybindings')

--Plugins
require('telescope-config')
require('nvim-treesitter-config')
require('nvim-lspconfig-config')
-- require('completion-nvim-config')
--require('coq_settings')
require('nvim-cmp-settings')
require('gitsigns-config')
-- require('nvim-tree-config')

require('github-theme').setup()

require('lualine').setup {
  options = {
    theme = 'github',
  }
}

