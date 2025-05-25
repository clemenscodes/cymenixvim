{...}: {
  extraConfigLuaPost = ''
    require('telescope').extensions.neoclip.default()
    require('telescope').extensions.macroscope.default()
  '';
  plugins = {
    neoclip = {
      enable = true;
      settings = {
        enable_persistent_history = true;
      };
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>fc";
            desc = "Find clips";
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
      action = ":Telescope neoclip";
      key = "<leader>fc";
      mode = "n";
      options = {
        silent = true;
        desc = "Find clips";
      };
    }
    {
      action = ":Telescope macroscope";
      key = "<leader>fm";
      mode = "n";
      options = {
        silent = true;
        desc = "Find macros";
      };
    }
    {
      action = ":lua require('neoclip').toggle()";
      key = "<leader>tc";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle neoclip";
      };
    }
  ];
}
