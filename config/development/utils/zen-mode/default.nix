{pkgs, ...}: {
  keymaps = [
    {
      action = ":ZenMode<CR>";
      key = "<leader>z";
      mode = "n";
      options = {
        silent = true;
        desc = "Zen mode";
      };
    }
  ];
  plugins = {
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>z";
            desc = "Zen mode";
          }
        ];
      };
    };
    zen-mode = {
      enable = true;
      settings = {
        window = {
          height = 1;
          width = 140;
          backdrop = 0.95;
          options = {
            signcolumn = "no";
            cursorline = false;
            cursorcolumn = false;
            foldcolumn = "0";
          };
        };
        plugins = {
          gitsigns = {
            enabled = true;
          };
          options = {
            enabled = true;
            ruler = false;
            showcmd = false;
            laststatus = 0;
          };
          twilight = {
            enabled = true;
          };
        };
        on_close =
          # Lua
          ''
            function(win)
              vim.cmd('GitBlameEnable')
              vim.cmd('IBLEnable')
            end
          '';
        on_open =
          # Lua
          ''
            function(win)
              vim.cmd('GitBlameDisable')
              vim.cmd('IBLDisable')
            end
          '';
      };
    };
  };
}
