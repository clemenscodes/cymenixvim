{...}: {
  plugins = {
    barbecue = {
      enable = true;
      settings = {
        attach_navic = false;
        show_navic = false;
      };
    };
    navbuddy = {
      enable = true;
      lsp = {
        autoAttach = true;
      };
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>tn";
            desc = "Toggle Navbuddy";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      action = ":Navbuddy<CR>";
      key = "<leader>tn";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle Navbuddy";
      };
    }
  ];
}
