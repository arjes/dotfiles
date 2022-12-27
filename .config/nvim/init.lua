require 'settings.options'
require 'settings.spelling'
require 'keybindings'

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)


require("lazy").setup('plugins')

-- require 'plugins.setup'
require 'languages'

-- Netrw disabled for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1



-- Global Key Bindings


-- This needs to be above cmp since it will overwrite tab then pass it along
-- require('nvim-tree-config')

-- require('neorg-config')

