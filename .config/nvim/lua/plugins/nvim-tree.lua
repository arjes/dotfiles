local M = {
  "nvim-tree/nvim-tree.lua",
  keys = {
    { "<leader>nt", "<cmd>NvimTreeToggle<cr>", desc = "NeoTree" },
    { "<leader>fnt", "<cmd>NvimTreeFindFile!<cr>", desc = "NeoTree" },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  }
}

function M.config()
  local status_ok, nvim_tree = pcall(require, "nvim-tree")
  if not status_ok then
    vim.notify("nvim-tree not found")
    return
  end


  local function on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', 's', api.node.open.vertical,   opts('Open VSplit'))
    vim.keymap.set('n', 'h', api.node.open.horizontal, opts('Open HSplit'))
    vim.keymap.set('n', 't', api.node.open.tab,        opts('Open In New Tab'))
    vim.keymap.set('n', '?', api.tree.toggle_help,     opts('Help'))
  end

  nvim_tree.setup({
    on_attach = on_attach,
    git = {
      ignore = true
    },
    filters = {
      dotfiles = true
    },
    view = {
      adaptive_size = false,
      -- mappings = {
      --   list = {
      --     { key = "s",                          action = "vsplit" },
      --     { key = "h",                          action = "split" },
      --     { key = "t",                          action = "tabnew" },
      --   },
      -- },
    },
  })

end

return M
