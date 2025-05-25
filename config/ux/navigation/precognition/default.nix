{...}: {
  plugins = {
    precognition = {
      enable = true;
      settings = {
        startVisible = false;
      };
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>tp";
            desc = "Precognition Toggle";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>tp";
      action.__raw = ''
        function()
          local toggled = vim.cmd("Precognition toggle")
          if toggled then
              vim.notify("Precognition on")
          else
              vim.notify("Precognition off")
          end
        end
      '';
      options = {
        silent = true;
        desc = "Precognition Toggle";
      };
    }
  ];
}
