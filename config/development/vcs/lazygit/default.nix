{...}: {
  plugins = {
    lazygit = {
      enable = true;
      settings = {};
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>g";
            group = "+Git";
          }
          {
            __unkeyed-1 = "<leader>gg";
            desc = "Open lazygit";
          }
          {
            __unkeyed-1 = "<leader>gg";
            desc = "Open project commits with lazygit";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      action = ":LazyGit<CR>";
      key = "<leader>gg";
      mode = "n";
      options = {
        silent = true;
        desc = "Open lazygit";
      };
    }
  ];
}
