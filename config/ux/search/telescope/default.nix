{
  pkgs,
  lib,
  ...
}: {config, ...}: {
  extraPackages = [
    pkgs.ripgrep
    pkgs.fd
    pkgs.manix
  ];
  extraPlugins = [pkgs.telescope-manix];
  extraConfigLuaPost = ''
    require('telescope').load_extension('manix')
  '';
  plugins = {
    telescope = {
      enable = true;

      lazyLoad.settings.cmd =
        ["Telescope"]
        ++ lib.optionals config.plugins.noice.enable [
          "Noice telescope"
        ];

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
            __unkeyed-1 = "<leader>fx";
            group = "+Manix documentation (Nix)";
          }
          {
            __unkeyed-1 = "<leader>fxf";
            desc = "Find manix documentation (Nix)";
          }
          {
            __unkeyed-1 = "<leader>fxu";
            desc = "Find manix documentation (Nix)";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>fxf";
      action = {
        __raw = ''
          function()
            require('telescope-manix').search()
          end
        '';
      };
      options = {
        silent = true;
        desc = "Find manix documentation (Nix)";
      };
    }
    {
      mode = "n";
      key = "<leader>fxu";
      action = {
        __raw = ''
          function()
            require('telescope-manix').search({
              cword = false,
              manix_args = { '--update-cache' }
            })
          end
        '';
      };
      options = {
        silent = true;
        desc = "Update manix documentation (Nix)";
      };
    }
  ];
}
