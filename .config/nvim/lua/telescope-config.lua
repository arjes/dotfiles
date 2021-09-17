local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      "vendor/*"
    },
    mappings = {
      n = {
        ["q"] = actions.close,
      },
    },
  }
}

