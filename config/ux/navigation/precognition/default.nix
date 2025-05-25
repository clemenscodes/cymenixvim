{...}: {
  plugins = {
    precognition = {
      enable = true;
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>tp";
            desc = "Toggle Precognition ";
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
          if require("precognition").toggle() then
              vim.notify("precognition on")
          else
              vim.notify("precognition off")
          end
        end
      '';
      options = {
        silent = true;
        desc = "Toggle Precognition ";
      };
    }
  ];
}
