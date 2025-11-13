{
  pkgs,
  lib,
  ...
}: {
  keymaps = [
    {
      action =
        # Lua
        ''
          function()
            require('lint').try_lint()
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
      lazyLoad.settings.event = "DeferredUIEnter";
      lintersByFt = {
        sh = ["shellcheck"];
        bash = ["shellcheck"];
        html = ["htmlhint"];
        css = ["stylelint"];
        javascript = ["eslint_d"];
        typescript = ["eslint_d"];
        markdown = ["markdownlint"];
        rust = ["clippy"];
        lua = ["luacheck"];
        nix = ["nix"];
        yaml = ["yamllint"];
        c = ["clangtidy"];
        cpp = ["clangtidy"];
        python = ["ruff"];
        cmake = ["cmakelint"];
      };
      linters = {
        htmlhint.cmd = lib.getExe pkgs.htmlhint;
        luacheck.cmd = lib.getExe pkgs.luaPackages.luacheck;
        eslint_d.cmd = lib.getExe pkgs.eslint_d;
        markdownlint.cmd = lib.getExe pkgs.markdownlint-cli;
        nix.cmd = lib.getExe' pkgs.nix "nix-instantiate";
        shellcheck.cmd = lib.getExe pkgs.shellcheck;
        stylelint.cmd = lib.getExe pkgs.stylelint;
        yamllint.cmd = lib.getExe pkgs.yamllint;
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
