{pkgs, ...}: {
  extraPackages = [
    pkgs.prettierd
    pkgs.stylua
    pkgs.alejandra
    pkgs.rustfmt
    pkgs.haskellPackages.cabal-fmt
  ];
  keymaps = [
    {
      action.__raw =
        /*
        lua
        */
        ''
          function()
            require("conform").format({ async = true, lsp_fallback = true })
          end
        '';
      key = "<leader>i";
      mode = "n";
      options = {
        silent = true;
        desc = "Format";
      };
    }
  ];
  plugins = {
    conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          nix = ["alejandra"];
          rust = ["rustfmt"];
          javascript = ["prettierd"];
          typescript = ["prettierd"];
          javascriptreact = ["prettierd"];
          typescriptreact = ["prettierd"];
          css = ["prettierd"];
          html = ["prettierd"];
          json = ["prettierd"];
          xml = ["xmlformat" "xmllint"];
          toml = ["taplo"];
          graphql = ["prettierd"];
          markdown = ["prettierd"];
          python = [
            "ruff_fix"
            "ruff_format"
            "ruff_organize_imports"
          ];
          c = ["clang_format"];
          cmake = ["cmake-format"];
          yaml = ["yamlfmt"];
          cpp = ["clang_format"];
        };
      };
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>i";
            desc = "Format";
          }
        ];
      };
    };
  };
}
