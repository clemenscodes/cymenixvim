{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./lines {inherit inputs pkgs lib;})
    (import ./servers {inherit inputs pkgs lib;})
  ];
  plugins = {
    lsp = {
      enable = true;
    };
    lspkind = {
      enable = true;
      cmp = {
        enable = true;
        menu = {
          buffer = "";
          calc = "";
          cmdline = "";
          codeium = "󱜙";
          copilot = "";
          emoji = "󰞅";
          git = "";
          luasnip = "󰩫";
          neorg = "";
          nvim_lsp = "";
          nvim_lua = "";
          path = "";
          spell = "";
          treesitter = "󰔱";
          nixpkgs_maintainers = "";
        };
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
  keymaps = [
    {
      action = {
        __raw = ''
          function()
            vim.lsp.buf.code_action()
          end
        '';
      };
      key = "ca";
      mode = "n";
      options = {
        silent = true;
        desc = "Select code action";
      };
    }
  ];
}
