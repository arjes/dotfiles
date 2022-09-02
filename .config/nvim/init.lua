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
   "hrsh7th/vim-vsnip";
   'hrsh7th/cmp-vsnip';

    "tpope/vim-surround";
    "simnalamburt/vim-mundo";

    { "bmalinconico/vim-test", branch="enable_auto_continue" };
    "lewis6991/gitsigns.nvim";
    "unblevable/quick-scope";
    "junegunn/vim-easy-align";
    "tpope/vim-fugitive";

    "fatih/vim-go";
    "sebdah/vim-delve";

    {"bmalinconico/neorg", branch="work_without_cd"};
}

-- General Config For All Buffers
require('settings')

require('spelling')

-- Global Key Bindings
require('keybindings')

-- require('null_ls')

--Plugins
require('telescope-config')
require('nvim-treesitter-config')
require('nvim-lspconfig-config')
-- require('completion-nvim-config')

--require('coq_settings')
-- This needs to be above cmp since it will overwrite tab then pass it along
require('nvim-vsnip-settings')
require('nvim-cmp-settings')

require('gitsigns-config')
-- require('nvim-tree-config')

require('github-theme').setup()

local current_signature = function()
  if not pcall(require, 'lsp_signature') then return end
  local sig = require("lsp_signature").status_line(150)
  if not sig.hint == "" then
    return sig.label .. "[" .. sig.hint .. "]"
  else
    return sig.label
  end
end

require('lualine').setup {
  options = {
    theme = 'auto',
  },
  sections = { 
     lualine_c = {'filename', current_signature} 
  }
}

require('golang')
require('lsp_signature_config')
require('neorg-config')
require('treesitter-text-objects-config')
