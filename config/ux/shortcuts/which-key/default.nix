{...}: {
  opts = {
    timeout = true;
    timeoutlen = 200;
  };
  plugins = {
    which-key = {
      enable = true;
      settings = {
        spec = [
          {
            __unkeyed-1 = "<Tab>";
            desc = "Next buffer";
          }
          {
            __unkeyed-1 = "<S-Tab>";
            desc = "Previous buffer";
          }
          {
            __unkeyed-1 = "<leader>h";
            desc = "Clear highlights and search term";
          }
          {
            __unkeyed-1 = "<leader>t";
            group = "+Toggle";
          }
        ];
      };
    };
  };
}
