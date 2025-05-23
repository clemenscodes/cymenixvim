{...}: {
  plugins = {
    yazi = {
      enable = true;
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>y";
            desc = "Toggle Yazi";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>y";
      action = "<CMD>Yazi<CR>";
      options = {
        desc = "Toggle Yazi";
      };
    }
  ];
}
