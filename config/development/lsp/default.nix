{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [(import ./servers {inherit inputs pkgs lib;})];
  plugins = {
    lsp = {
      enable = true;
      keymaps = {
        diagnostic = {
          "<leader>j" = "goto_next";
          "<leader>k" = "goto_prev";
        };
        lspBuf = {
          K = "hover";
          gD = "declaration";
          gr = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };
        silent = true;
      };
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "c";
            group = "+LSP";
          }
          {
            __unkeyed-1 = "ca";
            desc = "Select code action";
          }
        ];
      };
    };
  };
  extraConfigLuaPost =
    /*
    lua
    */
    ''
      vim.diagnostic.config({
          signs = {
              text = {
                  [vim.diagnostic.severity.ERROR] = '',
                  [vim.diagnostic.severity.WARN] = '',
                  [vim.diagnostic.severity.INFO] = '',
                  [vim.diagnostic.severity.HINT] = '',
              },
              linehl = {
                  [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
                  [vim.diagnostic.severity.WARN] = 'WarningMsg',
                  [vim.diagnostic.severity.INFO] = 'InformationMsg',
                  [vim.diagnostic.severity.HINT] = 'HintMsg',
              },
              numhl = {
                  [vim.diagnostic.severity.WARN] = 'WarningMsg',
                  [vim.diagnostic.severity.WARN] = 'WarningMsg',
                  [vim.diagnostic.severity.INFO] = 'InformationMsg',
                  [vim.diagnostic.severity.HINT] = 'HintMsg',
              },
          }
      })
    '';
  keymaps = [
    {
      action.__raw =
        /*
        lua
        */
        ''
          function()
              vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
          end
        '';
      key = "<leader>n";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle inlay hints";
      };
    }
    {
      action.__raw =
        /*
        lua
        */
        ''
          function()
            vim.lsp.buf.code_action()
          end
        '';
      key = "ca";
      mode = "n";
      options = {
        silent = true;
        desc = "Select code action";
      };
    }
  ];
}
