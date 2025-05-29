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
          "fdf" = {
            query = "@function.outer";
            desc = "Peak function definition";
          };
          "fdc" = {
            query = "@calss.outer";
            desc = "Peak class definition";
          };
        };
      };
      move = {
        enable = true;
        setJumps = true;
        gotoNextStart = {
          "ffo" = {
            query = "@function.outer";
            desc = "Next function (outer)";
          };
          "ffi" = {
            query = "@function.inner";
            desc = "Next function (inner)";
          };
          "fco" = {
            query = "@class.outer";
            desc = "Next class (outer)";
          };
          "fci" = {
            query = "@class.inner";
            desc = "Next class (inner)";
          };
          "flo" = {
            query = "@loop.outer";
            desc = "Next loop (outer)";
          };
          "fli" = {
            query = "@loop.inner";
            desc = "Next loop (inner)";
          };
          "fso" = {
            query = "@local.scope";
            queryGroup = "locals";
            desc = "Next local scope";
          };
          "fzo" = {
            query = "@fold";
            queryGroup = "folds";
            desc = "Next fold";
          };
          "fio" = {
            query = "@conditional.outer";
            desc = "Next conditional (outer)";
          };
          "fii" = {
            query = "@conditional.inner";
            desc = "Next conditional (inner)";
          };
          "fao" = {
            query = "@assignment.outer";
            desc = "Next assignment (outer)";
          };
          "fai" = {
            query = "@assignment.inner";
            desc = "Next assignment (inner)";
          };
          "fal" = {
            query = "@assignment.lhs";
            desc = "Next assignment left hand side (outer)";
          };
          "far" = {
            query = "@assignment.rhs";
            desc = "Next assignment right hand side (inner)";
          };
          "fuo" = {
            query = "@attribute.outer";
            desc = "Next attribute (outer)";
          };
          "fui" = {
            query = "@attribute.inner";
            desc = "Next attribute (inner)";
          };
          "feo" = {
            query = "@frame.outer";
            desc = "Next frame (outer)";
          };
          "fei" = {
            query = "@frame.inner";
            desc = "Next frame (inner)";
          };
          "fbo" = {
            query = "@block.outer";
            desc = "Next block (outer)";
          };
          "fbi" = {
            query = "@block.inner";
            desc = "Next block (inner)";
          };
          "fvo" = {
            query = "@call.outer";
            desc = "Next call (outer)";
          };
          "fvi" = {
            query = "@call.inner";
            desc = "Next call (inner)";
          };
          "fmo" = {
            query = "@comment.outer";
            desc = "Next comment (outer)";
          };
          "fmi" = {
            query = "@comment.inner";
            desc = "Next comment (inner)";
          };
          "fro" = {
            query = "@return.outer";
            desc = "Next return (outer)";
          };
          "fri" = {
            query = "@return.inner";
            desc = "Next return (inner)";
          };
          "fno" = {
            query = "@number.inner";
            desc = "Next number";
          };
          "fxo" = {
            query = "@regex.outer";
            desc = "Next regex (outer)";
          };
          "fxi" = {
            query = "@regex.inner";
            desc = "Next regex (inner)";
          };
          "fto" = {
            query = "@statement.outer";
            desc = "Next statement";
          };
          "fpo" = {
            query = "@parameter.outer";
            desc = "Next parameter (outer)";
          };
          "fpi" = {
            query = "@parameter.inner";
            desc = "Next parameter (inner)";
          };
        };
        gotoNextEnd = {
          "ffO" = {
            query = "@function.outer";
            desc = "End of next function (outer)";
          };
          "ffI" = {
            query = "@function.inner";
            desc = "End of next function (inner)";
          };
          "fcO" = {
            query = "@class.outer";
            desc = "End of next class (outer)";
          };
          "fcI" = {
            query = "@class.inner";
            desc = "End of next class (inner)";
          };
          "flO" = {
            query = "@loop.outer";
            desc = "End of next loop (outer)";
          };
          "flI" = {
            query = "@loop.inner";
            desc = "End of next loop (inner)";
          };
          "fsO" = {
            query = "@local.scope";
            queryGroup = "locals";
            desc = "End of next local scope";
          };
          "fzO" = {
            query = "@fold";
            queryGroup = "folds";
            desc = "End of next fold";
          };
          "fiO" = {
            query = "@conditional.outer";
            desc = "End of next conditional (outer)";
          };
          "fiI" = {
            query = "@conditional.inner";
            desc = "End of next conditional (inner)";
          };
          "faO" = {
            query = "@assignment.outer";
            desc = "End of next assignment (outer)";
          };
          "faI" = {
            query = "@assignment.inner";
            desc = "End of next assignment (inner)";
          };
          "faL" = {
            query = "@assignment.lhs";
            desc = "End of next assignment left hand sinde (outer)";
          };
          "faR" = {
            query = "@assignment.rhs";
            desc = "End of next assignment right hand side (inner)";
          };
          "fuO" = {
            query = "@attribute.outer";
            desc = "End of next attribute (outer)";
          };
          "fuI" = {
            query = "@attribute.inner";
            desc = "End of next attribute (inner)";
          };
          "feO" = {
            query = "@frame.outer";
            desc = "End of next frame (outer)";
          };
          "feI" = {
            query = "@frame.inner";
            desc = "End of next frame (inner)";
          };
          "fbO" = {
            query = "@block.outer";
            desc = "End of next block (outer)";
          };
          "fbI" = {
            query = "@block.inner";
            desc = "End of next block (inner)";
          };
          "fvO" = {
            query = "@call.outer";
            desc = "End of next call (outer)";
          };
          "fvI" = {
            query = "@call.inner";
            desc = "End of next call (inner)";
          };
          "fmO" = {
            query = "@comment.outer";
            desc = "End of next comment (outer)";
          };
          "fmI" = {
            query = "@comment.inner";
            desc = "End of next comment (inner)";
          };
          "frO" = {
            query = "@return.outer";
            desc = "End of next return (outer)";
          };
          "frI" = {
            query = "@return.inner";
            desc = "End of next return (inner)";
          };
          "fnO" = {
            query = "@number.inner";
            desc = "End of next number";
          };
          "fxO" = {
            query = "@regex.outer";
            desc = "End of next regex (outer)";
          };
          "fxI" = {
            query = "@regex.inner";
            desc = "End of next regex (inner)";
          };
          "ftO" = {
            query = "@statement.outer";
            desc = "End of next statement";
          };
          "fpO" = {
            query = "@parameter.outer";
            desc = "End of next parameter (outer)";
          };
          "fpI" = {
            query = "@parameter.inner";
            desc = "End of next parameter (inner)";
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
          "mao" = {
            query = "@assignment.outer";
            desc = "Previous assignment (outer)";
          };
          "mai" = {
            query = "@assignment.inner";
            desc = "Previous assignment (inner)";
          };
          "mal" = {
            query = "@assignment.lhs";
            desc = "Previous assignment left hand side (outer)";
          };
          "mar" = {
            query = "@assignment.rhs";
            desc = "Previous assignment right hand side (inner)";
          };
          "muo" = {
            query = "@attribute.outer";
            desc = "Previous attribute (outer)";
          };
          "mui" = {
            query = "@attribute.inner";
            desc = "Previous attribute (inner)";
          };
          "meo" = {
            query = "@frame.outer";
            desc = "Previous frame (outer)";
          };
          "mei" = {
            query = "@frame.inner";
            desc = "Previous frame (inner)";
          };
          "mbo" = {
            query = "@block.outer";
            desc = "Previous block (outer)";
          };
          "mbi" = {
            query = "@block.inner";
            desc = "Previous block (inner)";
          };
          "mvo" = {
            query = "@call.outer";
            desc = "Previous call (outer)";
          };
          "mvi" = {
            query = "@call.inner";
            desc = "Previous call (inner)";
          };
          "mmo" = {
            query = "@comment.outer";
            desc = "Previous comment (outer)";
          };
          "mmi" = {
            query = "@comment.inner";
            desc = "Previous comment (inner)";
          };
          "mro" = {
            query = "@return.outer";
            desc = "Previous return (outer)";
          };
          "mri" = {
            query = "@return.inner";
            desc = "Previous return (inner)";
          };
          "mno" = {
            query = "@number.inner";
            desc = "Previous number";
          };
          "mxo" = {
            query = "@regex.outer";
            desc = "Previous regex (outer)";
          };
          "mxi" = {
            query = "@regex.inner";
            desc = "Previous regex (inner)";
          };
          "mto" = {
            query = "@statement.outer";
            desc = "Previous statement";
          };
          "mpo" = {
            query = "@parameter.outer";
            desc = "Previous parameter (outer)";
          };
          "mpi" = {
            query = "@parameter.inner";
            desc = "Previous parameter (inner)";
          };
        };
        gotoPreviousEnd = {
          "mfO" = {
            query = "@function.outer";
            desc = "End of previous function (outer)";
          };
          "mfI" = {
            query = "@function.inner";
            desc = "End of previous function (inner)";
          };
          "mcO" = {
            query = "@class.outer";
            desc = "End of previous class (outer)";
          };
          "mcI" = {
            query = "@class.inner";
            desc = "End of previous class (inner)";
          };
          "mlO" = {
            query = "@loop.outer";
            desc = "End of previous loop (outer)";
          };
          "mlI" = {
            query = "@loop.inner";
            desc = "End of previous loop (inner)";
          };
          "msO" = {
            query = "@local.scope";
            queryGroup = "locals";
            desc = "End of previous local scope";
          };
          "mzO" = {
            query = "@fold";
            queryGroup = "folds";
            desc = "End of previous fold";
          };
          "miO" = {
            query = "@conditional.outer";
            desc = "End of previous conditional (outer)";
          };
          "miI" = {
            query = "@conditional.inner";
            desc = "End of previous conditional (inner)";
          };
          "maO" = {
            query = "@assignment.outer";
            desc = "End of previous assignment (outer)";
          };
          "maI" = {
            query = "@assignment.inner";
            desc = "End of previous assignment (inner)";
          };
          "maL" = {
            query = "@assignment.lhs";
            desc = "End of previous assignment left hand side (outer)";
          };
          "maR" = {
            query = "@assignment.rhs";
            desc = "End of previous assignment right hand side (inner)";
          };
          "muO" = {
            query = "@attribute.outer";
            desc = "End of previous attribute (outer)";
          };
          "muI" = {
            query = "@attribute.inner";
            desc = "End of previous attribute (inner)";
          };
          "meO" = {
            query = "@frame.outer";
            desc = "End of previous frame (outer)";
          };
          "meI" = {
            query = "@frame.inner";
            desc = "End of previous frame (inner)";
          };
          "mbO" = {
            query = "@block.outer";
            desc = "End of previous block (outer)";
          };
          "mbI" = {
            query = "@block.inner";
            desc = "End of previous block (inner)";
          };
          "mvO" = {
            query = "@call.outer";
            desc = "End of previous call (outer)";
          };
          "mvI" = {
            query = "@call.inner";
            desc = "End of previous call (inner)";
          };
          "mmO" = {
            query = "@comment.outer";
            desc = "End of previous comment (outer)";
          };
          "mmI" = {
            query = "@comment.inner";
            desc = "End of previous comment (inner)";
          };
          "mrO" = {
            query = "@return.outer";
            desc = "End of previous return (outer)";
          };
          "mrI" = {
            query = "@return.inner";
            desc = "End of previous return (inner)";
          };
          "mnO" = {
            query = "@number.inner";
            desc = "End of previous number";
          };
          "mxO" = {
            query = "@regex.outer";
            desc = "End of previous regex (outer)";
          };
          "mxI" = {
            query = "@regex.inner";
            desc = "End of previous regex (inner)";
          };
          "mtO" = {
            query = "@statement.outer";
            desc = "End of previous statement";
          };
          "mpO" = {
            query = "@parameter.outer";
            desc = "End of previous parameter (outer)";
          };
          "mpI" = {
            query = "@parameter.inner";
            desc = "End of previous parameter (inner)";
          };
        };
      };
      select = {
        enable = true;
        includeSurroundingWhitespace = true;
        lookahead = true;
        selectionModes = {
          "@assignment.inner" = "v";
          "@assignment.lhs" = "v";
          "@assignment.outer" = "V";
          "@assignment.rhs" = "v";
          "@attribute.inner" = "v";
          "@attribute.outer" = "v";
          "@block.inner" = "v";
          "@block.outer" = "V";
          "@call.inner" = "v";
          "@call.outer" = "v";
          "@class.inner" = "v";
          "@class.outer" = "V";
          "@comment.inner" = "v";
          "@comment.outer" = "v";
          "@conditional.inner" = "v";
          "@conditional.outer" = "V";
          "@frame.inner" = "v";
          "@frame.outer" = "V";
          "@function.inner" = "v";
          "@function.outer" = "V";
          "@loop.inner" = "v";
          "@loop.outer" = "V";
          "@number.inner" = "v";
          "@parameter.inner" = "v";
          "@parameter.outer" = "v";
          "@regex.inner" = "v";
          "@regex.outer" = "v";
          "@return.inner" = "v";
          "@return.outer" = "V";
          "@scopename.inner" = "v";
          "@statement.outer" = "V";
        };
        keymaps = {
          "ffo" = {
            query = "@function.outer";
            desc = "Next function (outer)";
          };
          "ffi" = {
            query = "@function.inner";
            desc = "Next function (inner)";
          };
          "fco" = {
            query = "@class.outer";
            desc = "Next class (outer)";
          };
          "fci" = {
            query = "@class.inner";
            desc = "Next class (inner)";
          };
          "flo" = {
            query = "@loop.outer";
            desc = "Next loop (outer)";
          };
          "fli" = {
            query = "@loop.inner";
            desc = "Next loop (inner)";
          };
          "fso" = {
            query = "@local.scope";
            queryGroup = "locals";
            desc = "Next local scope";
          };
          "fzo" = {
            query = "@fold";
            queryGroup = "folds";
            desc = "Next fold";
          };
          "fio" = {
            query = "@conditional.outer";
            desc = "Next conditional (outer)";
          };
          "fii" = {
            query = "@conditional.inner";
            desc = "Next conditional (inner)";
          };
          "fao" = {
            query = "@assignment.outer";
            desc = "Next assignment (outer)";
          };
          "fai" = {
            query = "@assignment.inner";
            desc = "Next assignment (inner)";
          };
          "fuo" = {
            query = "@attribute.outer";
            desc = "Next attribute (outer)";
          };
          "fui" = {
            query = "@attribute.inner";
            desc = "Next attribute (inner)";
          };
          "feo" = {
            query = "@frame.outer";
            desc = "Next frame (outer)";
          };
          "fei" = {
            query = "@frame.inner";
            desc = "Next frame (inner)";
          };
          "fbo" = {
            query = "@block.outer";
            desc = "Next block (outer)";
          };
          "fbi" = {
            query = "@block.inner";
            desc = "Next block (inner)";
          };
          "fvo" = {
            query = "@call.outer";
            desc = "Next call (outer)";
          };
          "fvi" = {
            query = "@call.inner";
            desc = "Next call (inner)";
          };
          "fmo" = {
            query = "@comment.outer";
            desc = "Next comment (outer)";
          };
          "fmi" = {
            query = "@comment.inner";
            desc = "Next comment (inner)";
          };
          "fro" = {
            query = "@return.outer";
            desc = "Next return (outer)";
          };
          "fri" = {
            query = "@return.inner";
            desc = "Next return (inner)";
          };
          "fno" = {
            query = "@number.inner";
            desc = "Next number";
          };
          "fxo" = {
            query = "@regex.outer";
            desc = "Next regex (outer)";
          };
          "fxi" = {
            query = "@regex.inner";
            desc = "Next regex (inner)";
          };
          "fto" = {
            query = "@statement.outer";
            desc = "Next statement";
          };
          "fpo" = {
            query = "@parameter.outer";
            desc = "Next parameter (outer)";
          };
          "fpi" = {
            query = "@parameter.inner";
            desc = "Next parameter (inner)";
          };
          "ffO" = {
            query = "@function.outer";
            desc = "End of next function (outer)";
          };
          "ffI" = {
            query = "@function.inner";
            desc = "End of next function (inner)";
          };
          "fcO" = {
            query = "@class.outer";
            desc = "End of next class (outer)";
          };
          "fcI" = {
            query = "@class.inner";
            desc = "End of next class (inner)";
          };
          "flO" = {
            query = "@loop.outer";
            desc = "End of next loop (outer)";
          };
          "flI" = {
            query = "@loop.inner";
            desc = "End of next loop (inner)";
          };
          "fsO" = {
            query = "@local.scope";
            queryGroup = "locals";
            desc = "End of next local scope";
          };
          "fzO" = {
            query = "@fold";
            queryGroup = "folds";
            desc = "End of next fold";
          };
          "fiO" = {
            query = "@conditional.outer";
            desc = "End of next conditional (outer)";
          };
          "fiI" = {
            query = "@conditional.inner";
            desc = "End of next conditional (inner)";
          };
          "faO" = {
            query = "@assignment.outer";
            desc = "End of next assignment (outer)";
          };
          "faI" = {
            query = "@assignment.inner";
            desc = "End of next assignment (inner)";
          };
          "fuO" = {
            query = "@attribute.outer";
            desc = "End of next attribute (outer)";
          };
          "fuI" = {
            query = "@attribute.inner";
            desc = "End of next attribute (inner)";
          };
          "feO" = {
            query = "@frame.outer";
            desc = "End of next frame (outer)";
          };
          "feI" = {
            query = "@frame.inner";
            desc = "End of next frame (inner)";
          };
          "fbO" = {
            query = "@block.outer";
            desc = "End of next block (outer)";
          };
          "fbI" = {
            query = "@block.inner";
            desc = "End of next block (inner)";
          };
          "fvO" = {
            query = "@call.outer";
            desc = "End of next call (outer)";
          };
          "fvI" = {
            query = "@call.inner";
            desc = "End of next call (inner)";
          };
          "fmO" = {
            query = "@comment.outer";
            desc = "End of next comment (outer)";
          };
          "fmI" = {
            query = "@comment.inner";
            desc = "End of next comment (inner)";
          };
          "frO" = {
            query = "@return.outer";
            desc = "End of next return (outer)";
          };
          "frI" = {
            query = "@return.inner";
            desc = "End of next return (inner)";
          };
          "fnO" = {
            query = "@number.inner";
            desc = "End of next number";
          };
          "fxO" = {
            query = "@regex.outer";
            desc = "End of next regex (outer)";
          };
          "fxI" = {
            query = "@regex.inner";
            desc = "End of next regex (inner)";
          };
          "ftO" = {
            query = "@statement.outer";
            desc = "End of next statement";
          };
          "fpO" = {
            query = "@parameter.outer";
            desc = "End of next parameter (outer)";
          };
          "fpI" = {
            query = "@parameter.inner";
            desc = "End of next parameter (inner)";
          };
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
          "mao" = {
            query = "@assignment.outer";
            desc = "Previous assignment (outer)";
          };
          "mai" = {
            query = "@assignment.inner";
            desc = "Previous assignment (inner)";
          };
          "muo" = {
            query = "@attribute.outer";
            desc = "Previous attribute (outer)";
          };
          "mui" = {
            query = "@attribute.inner";
            desc = "Previous attribute (inner)";
          };
          "meo" = {
            query = "@frame.outer";
            desc = "Previous frame (outer)";
          };
          "mei" = {
            query = "@frame.inner";
            desc = "Previous frame (inner)";
          };
          "mbo" = {
            query = "@block.outer";
            desc = "Previous block (outer)";
          };
          "mbi" = {
            query = "@block.inner";
            desc = "Previous block (inner)";
          };
          "mvo" = {
            query = "@call.outer";
            desc = "Previous call (outer)";
          };
          "mvi" = {
            query = "@call.inner";
            desc = "Previous call (inner)";
          };
          "mmo" = {
            query = "@comment.outer";
            desc = "Previous comment (outer)";
          };
          "mmi" = {
            query = "@comment.inner";
            desc = "Previous comment (inner)";
          };
          "mro" = {
            query = "@return.outer";
            desc = "Previous return (outer)";
          };
          "mri" = {
            query = "@return.inner";
            desc = "Previous return (inner)";
          };
          "mno" = {
            query = "@number.inner";
            desc = "Previous number";
          };
          "mxo" = {
            query = "@regex.outer";
            desc = "Previous regex (outer)";
          };
          "mxi" = {
            query = "@regex.inner";
            desc = "Previous regex (inner)";
          };
          "mto" = {
            query = "@statement.outer";
            desc = "Previous statement";
          };
          "mpo" = {
            query = "@parameter.outer";
            desc = "Previous parameter (outer)";
          };
          "mpi" = {
            query = "@parameter.inner";
            desc = "Previous parameter (inner)";
          };
          "mfO" = {
            query = "@function.outer";
            desc = "End of previous function (outer)";
          };
          "mfI" = {
            query = "@function.inner";
            desc = "End of previous function (inner)";
          };
          "mcO" = {
            query = "@class.outer";
            desc = "End of previous class (outer)";
          };
          "mcI" = {
            query = "@class.inner";
            desc = "End of previous class (inner)";
          };
          "mlO" = {
            query = "@loop.outer";
            desc = "End of previous loop (outer)";
          };
          "mlI" = {
            query = "@loop.inner";
            desc = "End of previous loop (inner)";
          };
          "msO" = {
            query = "@local.scope";
            queryGroup = "locals";
            desc = "End of previous local scope";
          };
          "mzO" = {
            query = "@fold";
            queryGroup = "folds";
            desc = "End of previous fold";
          };
          "miO" = {
            query = "@conditional.outer";
            desc = "End of previous conditional (outer)";
          };
          "miI" = {
            query = "@conditional.inner";
            desc = "End of previous conditional (inner)";
          };
          "maO" = {
            query = "@assignment.outer";
            desc = "End of previous assignment (outer)";
          };
          "maI" = {
            query = "@assignment.inner";
            desc = "End of previous assignment (inner)";
          };
          "muO" = {
            query = "@attribute.outer";
            desc = "End of previous attribute (outer)";
          };
          "muI" = {
            query = "@attribute.inner";
            desc = "End of previous attribute (inner)";
          };
          "meO" = {
            query = "@frame.outer";
            desc = "End of previous frame (outer)";
          };
          "meI" = {
            query = "@frame.inner";
            desc = "End of previous frame (inner)";
          };
          "mbO" = {
            query = "@block.outer";
            desc = "End of previous block (outer)";
          };
          "mbI" = {
            query = "@block.inner";
            desc = "End of previous block (inner)";
          };
          "mvO" = {
            query = "@call.outer";
            desc = "End of previous call (outer)";
          };
          "mvI" = {
            query = "@call.inner";
            desc = "End of previous call (inner)";
          };
          "mmO" = {
            query = "@comment.outer";
            desc = "End of previous comment (outer)";
          };
          "mmI" = {
            query = "@comment.inner";
            desc = "End of previous comment (inner)";
          };
          "mrO" = {
            query = "@return.outer";
            desc = "End of previous return (outer)";
          };
          "mrI" = {
            query = "@return.inner";
            desc = "End of previous return (inner)";
          };
          "mnO" = {
            query = "@number.inner";
            desc = "End of previous number";
          };
          "mxO" = {
            query = "@regex.outer";
            desc = "End of previous regex (outer)";
          };
          "mxI" = {
            query = "@regex.inner";
            desc = "End of previous regex (inner)";
          };
          "mtO" = {
            query = "@statement.outer";
            desc = "End of previous statement";
          };
          "mpO" = {
            query = "@parameter.outer";
            desc = "End of previous parameter (outer)";
          };
          "mpI" = {
            query = "@parameter.inner";
            desc = "End of previous parameter (inner)";
          };
        };
      };
      swap = {
        enable = true;
        swapNext = {
          "fop" = {
            query = "@parameter.inner";
            desc = "Swap with next parameter";
          };
        };
        swapPrevious = {
          "mop" = {
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
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "f";
            mode = ["n" "o" "x"];
            group = "+Next";
          }
          {
            __unkeyed-1 = "fa";
            mode = ["n" "o" "x"];
            group = "+Assignment";
          }
          {
            __unkeyed-1 = "fu";
            mode = ["n" "o" "x"];
            group = "+Attribute";
          }
          {
            __unkeyed-1 = "fe";
            mode = ["n" "o" "x"];
            group = "+Frame";
          }
          {
            __unkeyed-1 = "fb";
            mode = ["n" "o" "x"];
            group = "+Block";
          }
          {
            __unkeyed-1 = "fv";
            mode = ["n" "o" "x"];
            group = "+Call";
          }
          {
            __unkeyed-1 = "fm";
            mode = ["n" "o" "x"];
            group = "+Comment";
          }
          {
            __unkeyed-1 = "fr";
            mode = ["n" "o" "x"];
            group = "+Return";
          }
          {
            __unkeyed-1 = "fn";
            mode = ["n" "o" "x"];
            group = "+Number";
          }
          {
            __unkeyed-1 = "fx";
            mode = ["n" "o" "x"];
            group = "+Regex";
          }
          {
            __unkeyed-1 = "ft";
            mode = ["n" "o" "x"];
            group = "+Statement";
          }
          {
            __unkeyed-1 = "fc";
            mode = ["n" "o" "x"];
            group = "+Class";
          }
          {
            __unkeyed-1 = "ff";
            mode = ["n" "o" "x"];
            group = "+Function";
          }
          {
            __unkeyed-1 = "fl";
            mode = ["n" "o" "x"];
            group = "+Loop";
          }
          {
            __unkeyed-1 = "fs";
            mode = ["n" "o" "x"];
            group = "+Scope";
          }
          {
            __unkeyed-1 = "fz";
            mode = ["n" "o" "x"];
            group = "+Fold";
          }
          {
            __unkeyed-1 = "fi";
            mode = ["n" "o" "x"];
            group = "+Conditional";
          }
          {
            __unkeyed-1 = "fp";
            mode = ["n" "o" "x"];
            group = "+Parameter";
          }
          {
            __unkeyed-1 = "fo";
            mode = ["n" "o" "x"];
            group = "+Swap";
          }
          {
            __unkeyed-1 = "fd";
            mode = ["n" "o" "x"];
            group = "+Peek";
          }
          {
            __unkeyed-1 = "m";
            mode = ["n" "o" "x"];
            group = "+Previous";
          }
          {
            __unkeyed-1 = "ma";
            mode = ["n" "o" "x"];
            group = "+Assignment";
          }
          {
            __unkeyed-1 = "mu";
            mode = ["n" "o" "x"];
            group = "+Attribute";
          }
          {
            __unkeyed-1 = "me";
            mode = ["n" "o" "x"];
            group = "+Frame";
          }
          {
            __unkeyed-1 = "mb";
            mode = ["n" "o" "x"];
            group = "+Block";
          }
          {
            __unkeyed-1 = "mv";
            mode = ["n" "o" "x"];
            group = "+Call";
          }
          {
            __unkeyed-1 = "mm";
            mode = ["n" "o" "x"];
            group = "+Comment";
          }
          {
            __unkeyed-1 = "mr";
            mode = ["n" "o" "x"];
            group = "+Return";
          }
          {
            __unkeyed-1 = "mn";
            mode = ["n" "o" "x"];
            group = "+Number";
          }
          {
            __unkeyed-1 = "mx";
            mode = ["n" "o" "x"];
            group = "+Regex";
          }
          {
            __unkeyed-1 = "mt";
            mode = ["n" "o" "x"];
            group = "+Statement";
          }
          {
            __unkeyed-1 = "mc";
            mode = ["n" "o" "x"];
            group = "+Class";
          }
          {
            __unkeyed-1 = "mf";
            mode = ["n" "o" "x"];
            group = "+Function";
          }
          {
            __unkeyed-1 = "ml";
            mode = ["n" "o" "x"];
            group = "+Loop";
          }
          {
            __unkeyed-1 = "ms";
            mode = ["n" "o" "x"];
            group = "+Scope";
          }
          {
            __unkeyed-1 = "mz";
            mode = ["n" "o" "x"];
            group = "+Fold";
          }
          {
            __unkeyed-1 = "mi";
            mode = ["n" "o" "x"];
            group = "+Conditional";
          }
          {
            __unkeyed-1 = "mp";
            mode = ["n" "o" "x"];
            group = "+Parameter";
          }
          {
            __unkeyed-1 = "mo";
            mode = ["n" "o" "x"];
            group = "+Swap";
          }
          {
            __unkeyed-1 = "md";
            mode = ["n" "o" "x"];
            group = "+Peek";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      action = {
        __raw = ''
          function()
            require('which-key').show("f")
          end
        '';
      };
      key = "f";
      mode = ["n" "o" "x"];
      options = {
        silent = true;
      };
    }
    {
      action = {
        __raw = ''
          function()
            require('which-key').show("m")
          end
        '';
      };
      key = "m";
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
      key = ",";
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
      key = "-";
      mode = ["n" "o" "x"];
      options = {
        silent = true;
        desc = "Repeat last textobject move previous";
      };
    }
  ];
}
