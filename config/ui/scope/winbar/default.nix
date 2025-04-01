{...}: {
  plugins = {
    barbecue = {
      enable = true;
      settings = {
        attachNavic = true;
      };
    };
    navbuddy = {
      enable = true;
      lsp = {
        autoAttach = true;
      };
    };
    navic = {
      enable = false;
      settings = {
        click = true;
        highlight = true;
        lazyUpdateContext = true;
      };
    };
    trouble = {
      enable = true;
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
