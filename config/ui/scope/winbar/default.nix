{...}: {
  plugins = {
    barbecue = {
      enable = true;
      settings = {
        attach_navic = true;
        show_navic = true;
      };
    };
    navic = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      settings = {
        lsp = {
          auto_attach = true;
          preference = ["vtsls" "nil-ls" "tailwindcss"];
        };
        icons = {
          File = " ";
          Module = " ";
          Namespace = " ";
          Package = " ";
          Class = " ";
          Method = " ";
          Property = " ";
          Field = " ";
          Constructor = " ";
          Enum = " ";
          Interface = " ";
          Function = " ";
          Variable = " ";
          Constant = " ";
          String = " ";
          Number = " ";
          Boolean = " ";
          Array = " ";
          Object = " ";
          Key = " ";
          Null = " ";
          EnumMember = " ";
          Struct = " ";
          Event = " ";
          Operator = " ";
          TypeParameter = " ";
        };
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
