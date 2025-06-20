{...}: {
  plugins = {
    yazi = {
      enable = true;
      lazyLoad = {
        settings = {
          cmd = [
            "Yazi"
          ];
        };
      };
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>e";
            desc = "Toggle Yazi";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<CMD>Yazi<CR>";
      options = {
        desc = "Toggle Yazi";
      };
    }
  ];
}
