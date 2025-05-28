{...}: {
  keymaps = [
    {
      action = ":ZenMode<CR>";
      key = "<leader>z";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle Zen mode";
      };
    }
  ];
  plugins = {
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>z";
            desc = "Toggle Zen mode";
          }
        ];
      };
    };
    zen-mode = {
      enable = true;
      settings = {
        window = {
          height = 1;
          width = 120;
          backdrop = 0.95;
          options = {
            signcolumn = "no";
            cursorline = false;
            cursorcolumn = false;
            foldcolumn = "0";
          };
        };
        plugins = {
          options = {
            enabled = true;
            ruler = false;
            showcmd = false;
            laststatus = 0;
          };
        };
        on_close =
          # Lua
          ''
            function(win)

            end
          '';
        on_open =
          # Lua
          ''
            function(win)
              vim.cmd('GitBlameDisable')
            end
          '';
      };
    };
  };
}
