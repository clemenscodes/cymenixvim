{lib, ...}: {config, ...}: {
  colorschemes = {
    catppuccin = let
      flavour = "macchiato";
    in {
      enable = true;
      lazyLoad.enable = config.plugins.lz-n.enable;
      settings = {
        inherit flavour;
        background = {
          dark = flavour;
          light = flavour;
        };
        dimInactive = {
          enabled = true;
        };
        integrations = {
          alpha = true;
          gitsigns = true;
          notify = true;
          illuminate = {
            enabled = true;
            lsp = true;
          };
          treesitter = true;
          which_key = true;
          telescope = {
            enabled = true;
          };
          neotest = true;
          markdown = true;
          overseer = true;
          cmp = true;
          rainbow_delimiters = true;
          native_lsp = {
            enabled = true;
            inlay_hints = {
              background = true;
            };
            virtual_text = {
              errors = ["italic"];
              hints = ["italic"];
              warnings = ["italic"];
              information = ["italic"];
            };
            underlines = {
              errors = ["underline"];
              hints = ["underline"];
              warnings = ["underline"];
              information = ["underline"];
            };
          };
          navic = true;
          nvimtree = true;
          dap = {
            enabled = true;
            enable_ui = true;
          };
        };
      };
    };
  };
}
