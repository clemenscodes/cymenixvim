{...}: {
  plugins = {
    precognition = {
      enable = true;
      lazyLoad.settings.cmd = "Precognition";
      settings = {
        startVisible = false;
      };
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
      action = {
        __raw = ''
          function()
            if require("precognition").toggle() then
                vim.notify("precognition on")
            else
                vim.notify("precognition off")
            end
          end
        '';
      };
      options = {
        silent = true;
        desc = "Toggle Precognition ";
      };
    }
  ];
}
