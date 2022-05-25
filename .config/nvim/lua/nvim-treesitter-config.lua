require'nvim-treesitter.configs'.setup {
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

