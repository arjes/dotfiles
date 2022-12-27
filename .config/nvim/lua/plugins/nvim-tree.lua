local M = {
  "kyazdani42/nvim-tree.lua",
  keys = {
    { "<leader>nt", "<cmd>NvimTreeToggle<cr>", desc = "NeoTree" },
    { "<leader>fnt", "<cmd>NvimTreeFindFile!<cr>", desc = "NeoTree" },
  },
  dependencies = {
    "kyazdani42/nvim-web-devicons"
  }
}

function M.config()
  local status_ok, nvim_tree = pcall(require, "nvim-tree")
  if not status_ok then
    vim.notify("nvim-tree not found")
    return
  end


  nvim_tree.setup({
    git = {
      ignore = true
    },
    filters = {
      dotfiles = true
    },
    view = {
      adaptive_size = false,
      mappings = {
        list = {
          { key = "s",                          action = "vsplit" },
          { key = "h",                          action = "split" },
          { key = "t",                          action = "tabnew" },
        },
      },
    },
  })

end

return M
