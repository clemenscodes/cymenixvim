{lib, ...}: {config, ...}: {
  plugins = {
    lsp-lines = {
      enable = !config.plugins.tiny-inline-diagnostic.enable;
    };
    which-key = lib.mkIf config.plugins.lsp-lines.enable {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>tl";
            desc = "Toggle LSP lines";
          }
        ];
      };
    };
  };
  keymaps = lib.mkIf config.plugins.lsp-lines.enable [
    {
      action = {
        __raw = ''
          function()
            require('lsp_lines').toggle()
          end
        '';
      };
      key = "<leader>tl";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle LSP lines";
      };
    }
  ];
}
