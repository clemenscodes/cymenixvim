{...}: {
  plugins = {
    neoclip = {
      enable = true;
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>fy";
            desc = "Find yanks ";
          }
          {
            __unkeyed-1 = "<leader>fm";
            desc = "Find macros";
          }
          {
            __unkeyed-1 = "<leader>tc";
            desc = "Toggle neoclip";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      action = ":Telescope neoclip<CR>";
      key = "<leader>fy";
      mode = "n";
      options = {
        silent = true;
        desc = "Find clips";
      };
    }
    {
      action = ":Telescope macroscope<CR>";
      key = "<leader>fm";
      mode = "n";
      options = {
        silent = true;
        desc = "Find macros";
      };
    }
    {
      action = ":lua require('neoclip').toggle()<CR>";
      key = "<leader>tc";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle neoclip";
      };
    }
  ];
}
