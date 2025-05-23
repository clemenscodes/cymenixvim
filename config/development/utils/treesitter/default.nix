{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./ts-autotag {inherit inputs pkgs lib;})
    (import ./ts-context-commentstring {inherit inputs pkgs lib;})
  ];
  extraPackages = with pkgs; [tree-sitter nodejs_22 gcc];
  plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      nixGrammars = true;
      settings = {
        highlight = {
          additional_vim_regex_highlighting = true;
          enable = true;
          disable = ''
            function(lang, bufnr)
              return vim.api.nvim_buf_line_count(bufnr) > 10000
            end
          '';
        };
        incremental_selection = {
          enable = true;
          keymaps = {
            init_selection = "gnn";
            node_incremental = "grn";
            scope_incremental = "grc";
            node_decremental = "grm";
          };
        };
        indent = {
          enable = true;
        };
      };
    };
  };
}
