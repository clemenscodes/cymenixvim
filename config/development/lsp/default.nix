{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./servers {inherit inputs pkgs lib;})
    (import ./symbols {inherit inputs pkgs lib;})
  ];
  plugins = {
    lsp = {
      enable = true;
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
