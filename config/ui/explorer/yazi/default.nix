{...}: {
  plugins = {
    yazi = {
      enable = true;
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
