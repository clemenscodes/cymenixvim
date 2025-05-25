{...}: {
  plugins = {
    hardtime = {
      enable = true;
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>th";
            desc = "Toggle Hardtime";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>th";
      action = ":Hardtime toggle";
      options = {
        silent = true;
        desc = "Toggle Hardtime";
      };
    }
  ];
}
