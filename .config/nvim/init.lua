----- Directories {{{
vim.opt.directory="~/.vim/swap,/tmp"
vim.opt.undofile=true
vim.opt.backupdir="~/.vim/backup,/tmp"
vim.opt.undodir="~/.vim/undo,/tmp"
----- }}}

-- Plugins {{{
require "paq" {
    "savq/paq-nvim";
    "kyazdani42/nvim-web-devicons";
    "kyazdani42/nvim-tree.lua";
    "hoob3rt/lualine.nvim";
    "projekt0n/github-nvim-theme";

    -- Telescope Deps
    "nvim-lua/popup.nvim";
    "nvim-lua/plenary.nvim";
    "nvim-telescope/telescope.nvim";

    -- "justinmk/vim-sneak";
    {
      "nvim-treesitter/nvim-treesitter",
      run=function() vim.cmd ':TSUpdate' end
    };

    "neovim/nvim-lspconfig";

    "nvim-lua/completion-nvim";
    "steelsojka/completion-buffers";
    "nvim-treesitter/completion-treesitter";

    "tpope/vim-surround";
    "simnalamburt/vim-mundo";

    "janko-m/vim-test";
    "lewis6991/gitsigns.nvim";
    "unblevable/quick-scope";
}

-- General Config For All Buffers
require('settings')

-- Global Key Bindings
require('keybindings')

--Plugins
require('nvim-treesitter-config')
require('nvim-lspconfig-config')
require('completion-nvim-config')
require('gitsigns-config')

require('github-theme').setup()

-- Reload is required to fix a bug in lualine when the 
-- config is reloaded. https://github.com/hoob3rt/lualine.nvim/issues/276
require("plenary.reload").reload_module("lualine", true)
require('lualine').setup {
  options = {
    theme = 'github',
  }
}

