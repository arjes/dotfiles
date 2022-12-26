
require 'settings.options'
require 'settings.spelling'
require 'settings.theme'


require 'plugins.setup'
require 'languages'

-- Netrw disabled for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1



-- Global Key Bindings
require('keybindings')


-- This needs to be above cmp since it will overwrite tab then pass it along
-- require('nvim-tree-config')

-- require('neorg-config')

