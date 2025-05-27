{
  inputs,
  pkgs,
  lib,
  ...
}: let
  norg-meta = pkgs.tree-sitter-grammars.tree-sitter-norg-meta;
  norg = pkgs.tree-sitter-grammars.tree-sitter-norg;
in {
  imports = [
    (import ./ts-autotag {inherit inputs pkgs lib;})
    (import ./ts-context-commentstring {inherit inputs pkgs lib;})
  ];
  extraPackages = with pkgs; [tree-sitter nodejs_22 gcc];
  extraPlugins = [norg norg-meta];
  plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        html
        css
        scss
        javascript
        typescript
        angular
        editorconfig
        comment
        bash
        json
        markdown
        markdown_inline
        nix
        xml
        typst
        latex
        yaml
        dockerfile
        regex
        svelte
        tsx
        vue
        rust
        norg
        norg-meta
      ];
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
    treesitter-context = {
      settings = {
        max_lines = 4;
        min_window_height = 40;
        multiwindow = true;
        separator = "-";
      };
    };
    treesitter-refactor = {
      highlightDefinitions = {
        enable = true;
        clearOnCursorMove = true;
      };
      smartRename = {
        enable = true;
        keymaps = {
          smartRename = "grR";
        };
      };
      navigation = {
        enable = true;
      };
    };
  };
}
