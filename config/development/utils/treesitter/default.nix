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
      };
    };
    treesitter-textobjects = {
      enable = true;
      lspInterop = {
        enable = true;
        border = "rounded";
        floatingPreviewOpts = {};
        peekDefinitionCode = {
          ",df" = {
            query = "@function.outer";
            desc = "Peek function definition";
          };
          ",dc" = {
            query = "@calss.outer";
            desc = "Peek class definition";
          };
        };
      };
      move = {
        enable = true;
        setJumps = true;
        gotoNextStart = {
          ",fo" = {
            query = "@function.outer";
            desc = "Next function (outer)";
          };
          ",fi" = {
            query = "@function.inner";
            desc = "Next function (inner)";
          };
          ",co" = {
            query = "@class.outer";
            desc = "Next class (outer)";
          };
          ",ci" = {
            query = "@class.inner";
            desc = "Next class (inner)";
          };
          ",lo" = {
            query = "@loop.outer";
            desc = "Next loop (outer)";
          };
          ",li" = {
            query = "@loop.inner";
            desc = "Next loop (inner)";
          };
          ",so" = {
            query = "@local.scope";
            queryGroup = "locals";
            desc = "Next local scope";
          };
          ",zo" = {
            query = "@fold";
            queryGroup = "folds";
            desc = "Next fold";
          };
          ",io" = {
            query = "@conditional.outer";
            desc = "Next conditional (outer)";
          };
          ",ii" = {
            query = "@conditional.inner";
            desc = "Next conditional (inner)";
          };
          ",ao" = {
            query = "@assignment.outer";
            desc = "Next assignment (outer)";
          };
          ",ai" = {
            query = "@assignment.inner";
            desc = "Next assignment (inner)";
          };
          ",al" = {
            query = "@assignment.lhs";
            desc = "Next assignment left hand side (outer)";
          };
          ",ar" = {
            query = "@assignment.rhs";
            desc = "Next assignment right hand side (inner)";
          };
          ",uo" = {
            query = "@attribute.outer";
            desc = "Next attribute (outer)";
          };
          ",ui" = {
            query = "@attribute.inner";
            desc = "Next attribute (inner)";
          };
          ",eo" = {
            query = "@frame.outer";
            desc = "Next frame (outer)";
          };
          ",ei" = {
            query = "@frame.inner";
            desc = "Next frame (inner)";
          };
          ",bo" = {
            query = "@block.outer";
            desc = "Next block (outer)";
          };
          ",bi" = {
            query = "@block.inner";
            desc = "Next block (inner)";
          };
          ",vo" = {
            query = "@call.outer";
            desc = "Next call (outer)";
          };
          ",vi" = {
            query = "@call.inner";
            desc = "Next call (inner)";
          };
          ",mo" = {
            query = "@comment.outer";
            desc = "Next comment (outer)";
          };
          ",mi" = {
            query = "@comment.inner";
            desc = "Next comment (inner)";
          };
          ",ro" = {
            query = "@return.outer";
            desc = "Next return (outer)";
          };
          ",ri" = {
            query = "@return.inner";
            desc = "Next return (inner)";
          };
          ",no" = {
            query = "@number.inner";
            desc = "Next number";
          };
          ",xo" = {
            query = "@regex.outer";
            desc = "Next regex (outer)";
          };
          ",xi" = {
            query = "@regex.inner";
            desc = "Next regex (inner)";
          };
          ",to" = {
            query = "@statement.outer";
            desc = "Next statement";
          };
          ",po" = {
            query = "@parameter.outer";
            desc = "Next parameter (outer)";
          };
          ",pi" = {
            query = "@parameter.inner";
            desc = "Next parameter (inner)";
          };
        };
        gotoNextEnd = {
          ",fO" = {
            query = "@function.outer";
            desc = "End of next function (outer)";
          };
          ",fI" = {
            query = "@function.inner";
            desc = "End of next function (inner)";
          };
          ",cO" = {
            query = "@class.outer";
            desc = "End of next class (outer)";
          };
          ",cI" = {
            query = "@class.inner";
            desc = "End of next class (inner)";
          };
          ",lO" = {
            query = "@loop.outer";
            desc = "End of next loop (outer)";
          };
          ",lI" = {
            query = "@loop.inner";
            desc = "End of next loop (inner)";
          };
          ",sO" = {
            query = "@local.scope";
            queryGroup = "locals";
            desc = "End of next local scope";
          };
          ",zO" = {
            query = "@fold";
            queryGroup = "folds";
            desc = "End of next fold";
          };
          ",iO" = {
            query = "@conditional.outer";
            desc = "End of next conditional (outer)";
          };
          ",iI" = {
            query = "@conditional.inner";
            desc = "End of next conditional (inner)";
          };
          ",aO" = {
            query = "@assignment.outer";
            desc = "End of next assignment (outer)";
          };
          ",aI" = {
            query = "@assignment.inner";
            desc = "End of next assignment (inner)";
          };
          ",aL" = {
            query = "@assignment.lhs";
            desc = "End of next assignment left hand sinde (outer)";
          };
          ",aR" = {
            query = "@assignment.rhs";
            desc = "End of next assignment right hand side (inner)";
          };
          ",uO" = {
            query = "@attribute.outer";
            desc = "End of next attribute (outer)";
          };
          ",uI" = {
            query = "@attribute.inner";
            desc = "End of next attribute (inner)";
          };
          ",eO" = {
            query = "@frame.outer";
            desc = "End of next frame (outer)";
          };
          ",eI" = {
            query = "@frame.inner";
            desc = "End of next frame (inner)";
          };
          ",bO" = {
            query = "@block.outer";
            desc = "End of next block (outer)";
          };
          ",bI" = {
            query = "@block.inner";
            desc = "End of next block (inner)";
          };
          ",vO" = {
            query = "@call.outer";
            desc = "End of next call (outer)";
          };
          ",vI" = {
            query = "@call.inner";
            desc = "End of next call (inner)";
          };
          ",mO" = {
            query = "@comment.outer";
            desc = "End of next comment (outer)";
          };
          ",mI" = {
            query = "@comment.inner";
            desc = "End of next comment (inner)";
          };
          ",rO" = {
            query = "@return.outer";
            desc = "End of next return (outer)";
          };
          ",rI" = {
            query = "@return.inner";
            desc = "End of next return (inner)";
          };
          ",nO" = {
            query = "@number.inner";
            desc = "End of next number";
          };
          ",xO" = {
            query = "@regex.outer";
            desc = "End of next regex (outer)";
          };
          ",xI" = {
            query = "@regex.inner";
            desc = "End of next regex (inner)";
          };
          ",tO" = {
            query = "@statement.outer";
            desc = "End of next statement";
          };
          ",pO" = {
            query = "@parameter.outer";
            desc = "End of next parameter (outer)";
          };
          ",pI" = {
            query = "@parameter.inner";
            desc = "End of next parameter (inner)";
          };
        };
        gotoPreviousStart = {
          "-fo" = {
            query = "@function.outer";
            desc = "Previous function (outer)";
          };
          "-fi" = {
            query = "@function.inner";
            desc = "Previous function (inner)";
          };
          "-co" = {
            query = "@class.outer";
            desc = "Previous class (outer)";
          };
          "-ci" = {
            query = "@class.inner";
            desc = "Previous class (inner)";
          };
          "-lo" = {
            query = "@loop.outer";
            desc = "Previous loop (outer)";
          };
          "-li" = {
            query = "@loop.inner";
            desc = "Previous loop (inner)";
          };
          "-so" = {
            query = "@local.scope";
            queryGroup = "locals";
            desc = "Previous local scope";
          };
          "-zo" = {
            query = "@fold";
            queryGroup = "folds";
            desc = "Previous fold";
          };
          "-io" = {
            query = "@conditional.outer";
            desc = "Previous conditional (outer)";
          };
          "-ii" = {
            query = "@conditional.inner";
            desc = "Previous conditional (inner)";
          };
          "-ao" = {
            query = "@assignment.outer";
            desc = "Previous assignment (outer)";
          };
          "-ai" = {
            query = "@assignment.inner";
            desc = "Previous assignment (inner)";
          };
          "-al" = {
            query = "@assignment.lhs";
            desc = "Previous assignment left hand side (outer)";
          };
          "-ar" = {
            query = "@assignment.rhs";
            desc = "Previous assignment right hand side (inner)";
          };
          "-uo" = {
            query = "@attribute.outer";
            desc = "Previous attribute (outer)";
          };
          "-ui" = {
            query = "@attribute.inner";
            desc = "Previous attribute (inner)";
          };
          "-eo" = {
            query = "@frame.outer";
            desc = "Previous frame (outer)";
          };
          "-ei" = {
            query = "@frame.inner";
            desc = "Previous frame (inner)";
          };
          "-bo" = {
            query = "@block.outer";
            desc = "Previous block (outer)";
          };
          "-bi" = {
            query = "@block.inner";
            desc = "Previous block (inner)";
          };
          "-vo" = {
            query = "@call.outer";
            desc = "Previous call (outer)";
          };
          "-vi" = {
            query = "@call.inner";
            desc = "Previous call (inner)";
          };
          "-mo" = {
            query = "@comment.outer";
            desc = "Previous comment (outer)";
          };
          "-mi" = {
            query = "@comment.inner";
            desc = "Previous comment (inner)";
          };
          "-ro" = {
            query = "@return.outer";
            desc = "Previous return (outer)";
          };
          "-ri" = {
            query = "@return.inner";
            desc = "Previous return (inner)";
          };
          "-no" = {
            query = "@number.inner";
            desc = "Previous number";
          };
          "-xo" = {
            query = "@regex.outer";
            desc = "Previous regex (outer)";
          };
          "-xi" = {
            query = "@regex.inner";
            desc = "Previous regex (inner)";
          };
          "-to" = {
            query = "@statement.outer";
            desc = "Previous statement";
          };
          "-po" = {
            query = "@parameter.outer";
            desc = "Previous parameter (outer)";
          };
          "-pi" = {
            query = "@parameter.inner";
            desc = "Previous parameter (inner)";
          };
        };
        gotoPreviousEnd = {
          "-fO" = {
            query = "@function.outer";
            desc = "End of previous function (outer)";
          };
          "-fI" = {
            query = "@function.inner";
            desc = "End of previous function (inner)";
          };
          "-cO" = {
            query = "@class.outer";
            desc = "End of previous class (outer)";
          };
          "-cI" = {
            query = "@class.inner";
            desc = "End of previous class (inner)";
          };
          "-lO" = {
            query = "@loop.outer";
            desc = "End of previous loop (outer)";
          };
          "-lI" = {
            query = "@loop.inner";
            desc = "End of previous loop (inner)";
          };
          "-sO" = {
            query = "@local.scope";
            queryGroup = "locals";
            desc = "End of previous local scope";
          };
          "-zO" = {
            query = "@fold";
            queryGroup = "folds";
            desc = "End of previous fold";
          };
          "-iO" = {
            query = "@conditional.outer";
            desc = "End of previous conditional (outer)";
          };
          "-iI" = {
            query = "@conditional.inner";
            desc = "End of previous conditional (inner)";
          };
          "-aO" = {
            query = "@assignment.outer";
            desc = "End of previous assignment (outer)";
          };
          "-aI" = {
            query = "@assignment.inner";
            desc = "End of previous assignment (inner)";
          };
          "-aL" = {
            query = "@assignment.lhs";
            desc = "End of previous assignment left hand side (outer)";
          };
          "-aR" = {
            query = "@assignment.rhs";
            desc = "End of previous assignment right hand side (inner)";
          };
          "-uO" = {
            query = "@attribute.outer";
            desc = "End of previous attribute (outer)";
          };
          "-uI" = {
            query = "@attribute.inner";
            desc = "End of previous attribute (inner)";
          };
          "-eO" = {
            query = "@frame.outer";
            desc = "End of previous frame (outer)";
          };
          "-eI" = {
            query = "@frame.inner";
            desc = "End of previous frame (inner)";
          };
          "-bO" = {
            query = "@block.outer";
            desc = "End of previous block (outer)";
          };
          "-bI" = {
            query = "@block.inner";
            desc = "End of previous block (inner)";
          };
          "-vO" = {
            query = "@call.outer";
            desc = "End of previous call (outer)";
          };
          "-vI" = {
            query = "@call.inner";
            desc = "End of previous call (inner)";
          };
          "-mO" = {
            query = "@comment.outer";
            desc = "End of previous comment (outer)";
          };
          "-mI" = {
            query = "@comment.inner";
            desc = "End of previous comment (inner)";
          };
          "-rO" = {
            query = "@return.outer";
            desc = "End of previous return (outer)";
          };
          "-rI" = {
            query = "@return.inner";
            desc = "End of previous return (inner)";
          };
          "-nO" = {
            query = "@number.inner";
            desc = "End of previous number";
          };
          "-xO" = {
            query = "@regex.outer";
            desc = "End of previous regex (outer)";
          };
          "-xI" = {
            query = "@regex.inner";
            desc = "End of previous regex (inner)";
          };
          "-tO" = {
            query = "@statement.outer";
            desc = "End of previous statement";
          };
          "-pO" = {
            query = "@parameter.outer";
            desc = "End of previous parameter (outer)";
          };
          "-pI" = {
            query = "@parameter.inner";
            desc = "End of previous parameter (inner)";
          };
        };
      };
      select = {
        enable = false;
      };
      swap = {
        enable = true;
        swapNext = {
          ",op" = {
            query = "@parameter.inner";
            desc = "Swap with next parameter";
          };
        };
        swapPrevious = {
          "-op" = {
            query = "@parameter.inner";
            desc = "Swap with previous parameter";
          };
        };
      };
    };
    treesitter-context = {
      settings = {
        max_lines = 4;
        min_window_height = 40;
        multiwindow = true;
        separator = ",";
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
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = ",";
            mode = ["n" "o" "x"];
            group = "+Next";
          }
          {
            __unkeyed-1 = ",a";
            mode = ["n" "o" "x"];
            group = "+Assignment";
          }
          {
            __unkeyed-1 = ",u";
            mode = ["n" "o" "x"];
            group = "+Attribute";
          }
          {
            __unkeyed-1 = ",e";
            mode = ["n" "o" "x"];
            group = "+Frame";
          }
          {
            __unkeyed-1 = ",b";
            mode = ["n" "o" "x"];
            group = "+Block";
          }
          {
            __unkeyed-1 = ",v";
            mode = ["n" "o" "x"];
            group = "+Call";
          }
          {
            __unkeyed-1 = ",m";
            mode = ["n" "o" "x"];
            group = "+Comment";
          }
          {
            __unkeyed-1 = ",r";
            mode = ["n" "o" "x"];
            group = "+Return";
          }
          {
            __unkeyed-1 = ",n";
            mode = ["n" "o" "x"];
            group = "+Number";
          }
          {
            __unkeyed-1 = ",x";
            mode = ["n" "o" "x"];
            group = "+Regex";
          }
          {
            __unkeyed-1 = ",t";
            mode = ["n" "o" "x"];
            group = "+Statement";
          }
          {
            __unkeyed-1 = ",c";
            mode = ["n" "o" "x"];
            group = "+Class";
          }
          {
            __unkeyed-1 = ",f";
            mode = ["n" "o" "x"];
            group = "+Function";
          }
          {
            __unkeyed-1 = ",l";
            mode = ["n" "o" "x"];
            group = "+Loop";
          }
          {
            __unkeyed-1 = ",s";
            mode = ["n" "o" "x"];
            group = "+Scope";
          }
          {
            __unkeyed-1 = ",z";
            mode = ["n" "o" "x"];
            group = "+Fold";
          }
          {
            __unkeyed-1 = ",i";
            mode = ["n" "o" "x"];
            group = "+Conditional";
          }
          {
            __unkeyed-1 = ",p";
            mode = ["n" "o" "x"];
            group = "+Parameter";
          }
          {
            __unkeyed-1 = ",o";
            mode = ["n" "o" "x"];
            group = "+Swap";
          }
          {
            __unkeyed-1 = ",d";
            mode = ["n" "o" "x"];
            group = "+Peek";
          }
          {
            __unkeyed-1 = "-";
            mode = ["n" "o" "x"];
            group = "+Previous";
          }
          {
            __unkeyed-1 = "-a";
            mode = ["n" "o" "x"];
            group = "+Assignment";
          }
          {
            __unkeyed-1 = "-u";
            mode = ["n" "o" "x"];
            group = "+Attribute";
          }
          {
            __unkeyed-1 = "-e";
            mode = ["n" "o" "x"];
            group = "+Frame";
          }
          {
            __unkeyed-1 = "-b";
            mode = ["n" "o" "x"];
            group = "+Block";
          }
          {
            __unkeyed-1 = "-v";
            mode = ["n"];
            group = "+Call";
          }
          {
            __unkeyed-1 = "-m";
            mode = ["n" "o" "x"];
            group = "+Comment";
          }
          {
            __unkeyed-1 = "-r";
            mode = ["n" "o" "x"];
            group = "+Return";
          }
          {
            __unkeyed-1 = "-n";
            mode = ["n" "o" "x"];
            group = "+Number";
          }
          {
            __unkeyed-1 = "-x";
            mode = ["n" "o" "x"];
            group = "+Regex";
          }
          {
            __unkeyed-1 = "-t";
            mode = ["n" "o" "x"];
            group = "+Statement";
          }
          {
            __unkeyed-1 = "-c";
            mode = ["n" "o" "x"];
            group = "+Class";
          }
          {
            __unkeyed-1 = "-f";
            mode = ["n" "o" "x"];
            group = "+Function";
          }
          {
            __unkeyed-1 = "-l";
            mode = ["n" "o" "x"];
            group = "+Loop";
          }
          {
            __unkeyed-1 = "-s";
            mode = ["n" "o" "x"];
            group = "+Scope";
          }
          {
            __unkeyed-1 = "-z";
            mode = ["n" "o" "x"];
            group = "+Fold";
          }
          {
            __unkeyed-1 = "-i";
            mode = ["n" "o" "x"];
            group = "+Conditional";
          }
          {
            __unkeyed-1 = "-p";
            mode = ["n" "o" "x"];
            group = "+Parameter";
          }
          {
            __unkeyed-1 = "-o";
            mode = ["n" "o" "x"];
            group = "+Swap";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      action = {
        __raw =
          # Lua
          ''
            function()
              require('which-key').show(",")
            end
          '';
      };
      key = ",";
      mode = ["n" "o" "x"];
      options = {
        silent = true;
      };
    }
    {
      action = {
        __raw = ''
          function()
            require('which-key').show("-")
          end
        '';
      };
      key = "-";
      mode = ["n" "o" "x"];
      options = {
        silent = true;
      };
    }
    {
      action = {
        __raw = ''
          function()
            require('nvim-treesitter.textobjects.repeatable_move').repeat_last_move_next()
          end
        '';
      };
      key = ";";
      mode = ["n" "o" "x"];
      options = {
        silent = true;
        desc = "Repeat last textobject move next";
      };
    }
    {
      action = {
        __raw = ''
          function()
            require('nvim-treesitter.textobjects.repeatable_move').repeat_last_move_previous()
          end
        '';
      };
      key = "_";
      mode = ["n" "o" "x"];
      options = {
        silent = true;
        desc = "Repeat last textobject move previous";
      };
    }
  ];
}
