{pkgs, ...}: {
  extraPackages = [
    pkgs.ripgrep
    pkgs.fd
  ];
  plugins = {
    telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
          settings = {
            caseMode = "smart_case";
            fuzzy = true;
          };
        };
      };
      highlightTheme = "catppuccin";
      keymaps = {};
      settings = {};
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>f";
            group = "+Telescope";
          }
          {
            __unkeyed-1 = "<leader>ff";
            desc = "Find files";
          }
          {
            __unkeyed-1 = "<leader>fg";
            desc = "Live grep";
          }
          {
            __unkeyed-1 = "<leader>fp";
            desc = "Projects";
          }
          {
            __unkeyed-1 = "<leader>fn";
            desc = "Nix";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      action = ":Telescope find_files<CR>";
      key = "<leader>ff";
      mode = "n";
      options = {
        silent = true;
        desc = "Find files";
      };
    }
    {
      action = ":Telescope live_grep<CR>";
      key = "<leader>fg";
      mode = "n";
      options = {
        silent = true;
        desc = "Live grep";
      };
    }
    {
      action = ":Telescope projects<CR>";
      key = "<leader>fp";
      mode = "n";
      options = {
        silent = true;
        desc = "Projects";
      };
    }
  ];
}
