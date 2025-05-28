{...}: {
  plugins = {
    spectre = {
      enable = true;
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>s";
            desc = "Spectre";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>ss";
      action = "<cmd>Spectre<CR>";
      options = {
        desc = "Spectre toggle";
      };
    }
  ];
}
