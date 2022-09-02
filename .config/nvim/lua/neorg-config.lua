require('neorg').setup {
  load = {
    ["core.keybinds"] = {
      config = {
        default_keybinds = true,
        neorg_leader = "<localleader>"
      }
    },
    ["core.defaults"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          journal = '~/neorg/journal',
          gtd = '~/neorg/gtd/',
        }
      }
    },
    ["core.norg.concealer"] = { 
      config = {
        folds = false
      }
    },
    ["core.gtd.base"] = {
      config = {
        workspace = "gtd"
      }
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp"
      }
    },
    ["core.norg.journal"] = {
      config = {
        workspace = "journal"
      }
    },
  }
}

-- Startup Neorg
-- vim.cmd [[
--   NeorgStart
--   Neorg mode test
--   Neorg mode norg
-- ]]

local map = vim.api.nvim_set_keymap

map('n', '<leader>tc', '<Cmd>Neorg keybind norg core.gtd.base.capture<CR>', {noremap = true})
map('n', '<leader>tv', '<Cmd>Neorg keybind norg core.gtd.base.views<CR>', {noremap = true})
map('n', '<leader>te', '<Cmd>Neorg keybind norg core.gtd.base.edit<CR>', {noremap = true})
map('n', '<leader>nn', '<Cmd>Neorg keybind norg core.norg.dirman.new.note<CR>', {noremap = true})

-- Journal commands
map('n', '<leader>jt', '<Cmd>Neorg journal today<CR>', {noremap = true})
map('n', '<leader>jy', '<Cmd>Neorg journal yesterday<CR>', {noremap = true})
map('n', '<leader>jn', '<Cmd>Neorg journal tomorrow<CR>', {noremap = true})
