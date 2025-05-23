{pkgs, ...}: {
  extraPackages = [pkgs.eslint_d];
  keymaps = [
    {
      action =
        /*
        lua
        */
        ''
          function()
            lint.try_lint()
          end
        '';
      key = "<leader>l";
      mode = "n";
      options = {
        silent = true;
        desc = "Trigger linting for current file";
      };
    }
  ];
  plugins = {
    lint = {
      enable = true;
      lintersByFt = {
        javascript = ["eslint_d"];
        typescript = ["eslint_d"];
        javascriptreact = ["eslint_d"];
        typescriptreact = ["eslint_d"];
      };
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>l";
            desc = "Trigger linting for current file";
          }
        ];
      };
    };
  };
}
