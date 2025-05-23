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
        ui-select = {
          enable = true;
          settings = {
            __unkeyed-1 = {
              __raw = ''require("telescope.themes").get_dropdown{}'';
            };
          };
        };
      };
      highlightTheme = "Catppuccin Macchiato";
      keymaps = {};
      settings = {
        defaults = {
          file_ignore_patterns = [
            "^.git/"
            "^output/"
            "^data/"
            "^node_modules/"
            "^build/"
            "^target/"
            "^dist/"
          ];
          set_env = {
            COLORTERM = "truecolor";
          };
        };

        pickers = {
          colorscheme = {
            enable_preview = true;
          };
        };
      };
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
