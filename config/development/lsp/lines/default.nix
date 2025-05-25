{...}: {
  plugins = {
    lsp-lines = {
      enable = true;
    };
    which-key = {
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
  keymaps = [
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
