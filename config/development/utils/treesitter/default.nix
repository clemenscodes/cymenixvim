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
    treesitter-textobjects = {
      enable = true;
      lspInterop = {
        enable = true;
        border = "rounded";
      };
      move = {
        enable = true;
        setJumps = true;
        gotoNextStart = {
          "nfo" = {
            query = "@function.outer";
            desc = "Next function (outer)";
          };
          "nfi" = {
            query = "@function.inner";
            desc = "Next function (inner)";
          };
          "nco" = {
            query = "@class.outer";
            desc = "Next class (outer)";
          };
          "nci" = {
            query = "@class.inner";
            desc = "Next class (inner)";
          };
          "nlo" = {
            query = "@loop.outer";
            desc = "Next loop (outer)";
          };
          "nli" = {
            query = "@loop.inner";
            desc = "Next loop (inner)";
          };
          "nso" = {
            query = "@local.scope";
            queryGroup = "locals";
            desc = "Next local scope";
          };
          "nzo" = {
            query = "@fold";
            queryGroup = "folds";
            desc = "Next fold";
          };
          "nio" = {
            query = "@conditional.outer";
            desc = "Next conditional (outer)";
          };
          "nii" = {
            query = "@conditional.inner";
            desc = "Next conditional (inner)";
          };
        };
        gotoNextEnd = {
          "nFo" = {
            query = "@function.outer";
            desc = "End of next function (outer)";
          };
          "nFi" = {
            query = "@function.inner";
            desc = "End of next function (inner)";
          };
          "nCo" = {
            query = "@class.outer";
            desc = "End of next class (outer)";
          };
          "nCi" = {
            query = "@class.inner";
            desc = "End of next class (inner)";
          };
          "nLo" = {
            query = "@loop.outer";
            desc = "End of next loop (outer)";
          };
          "nLi" = {
            query = "@loop.inner";
            desc = "End of next loop (inner)";
          };
          "nSo" = {
            query = "@local.scope";
            queryGroup = "locals";
            desc = "End of next local scope";
          };
          "nUo" = {
            query = "@fold";
            queryGroup = "folds";
            desc = "End of next fold";
          };
          "nIo" = {
            query = "@conditional.outer";
            desc = "End of next conditional (outer)";
          };
          "nIi" = {
            query = "@conditional.inner";
            desc = "End of next conditional (inner)";
          };
        };
        gotoPreviousStart = {
          "mfo" = {
            query = "@function.outer";
            desc = "Previous function (outer)";
          };
          "mfi" = {
            query = "@function.inner";
            desc = "Previous function (inner)";
          };
          "mco" = {
            query = "@class.outer";
            desc = "Previous class (outer)";
          };
          "mci" = {
            query = "@class.inner";
            desc = "Previous class (inner)";
          };
          "mlo" = {
            query = "@loop.outer";
            desc = "Previous loop (outer)";
          };
          "mli" = {
            query = "@loop.inner";
            desc = "Previous loop (inner)";
          };
          "mso" = {
            query = "@local.scope";
            queryGroup = "locals";
            desc = "Previous local scope";
          };
          "mzo" = {
            query = "@fold";
            queryGroup = "folds";
            desc = "Previous fold";
          };
          "mio" = {
            query = "@conditional.outer";
            desc = "Previous conditional (outer)";
          };
          "mii" = {
            query = "@conditional.inner";
            desc = "Previous conditional (inner)";
          };
        };
        gotoPreviousEnd = {
          "mFo" = {
            query = "@function.outer";
            desc = "End of previous function (outer)";
          };
          "mFi" = {
            query = "@function.inner";
            desc = "End of previous function (inner)";
          };
          "mCo" = {
            query = "@class.outer";
            desc = "End of previous class (outer)";
          };
          "mCi" = {
            query = "@class.inner";
            desc = "End of previous class (inner)";
          };
          "mLo" = {
            query = "@loop.outer";
            desc = "End of previous loop (outer)";
          };
          "mLi" = {
            query = "@loop.inner";
            desc = "End of previous loop (inner)";
          };
          "mSo" = {
            query = "@local.scope";
            queryGroup = "locals";
            desc = "End of previous local scope";
          };
          "mUo" = {
            query = "@fold";
            queryGroup = "folds";
            desc = "End of previous fold";
          };
          "mIo" = {
            query = "@conditional.outer";
            desc = "End of previous conditional (outer)";
          };
          "mIi" = {
            query = "@conditional.inner";
            desc = "End of previous conditional (inner)";
          };
        };
      };
      select = {
        enable = true;
      };
      swap = {
        enable = true;
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
