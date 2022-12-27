local M = {
  "nvim-treesitter/nvim-treesitter",
  build=function() vim.cmd ':TSUpdate' end
}

function M.config()
  local status_ok, nvimts = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    vim.notify("nvim-treesitter not found")
    return
  end

  nvimts.setup {
    ensure_installed = {
      "bash";
      "comment";
      "css";
      "dockerfile";
      "go";
      "gomod";
      "hcl";
      "html";
      "javascript";
      "json";
      "lua";
      "regex";
      "ruby";
      "scss";
      "toml";
      "tsx";
      "typescript";
      "yaml";
      "query";
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    endwise = {
      enable = true,
    },
  }
end

return M
