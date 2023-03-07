local M = {
  "fatih/vim-go",
  build = ":GoInstallBinaries",
  ft = "go",
  enabled = false,
}

function M.config()
end

return M
