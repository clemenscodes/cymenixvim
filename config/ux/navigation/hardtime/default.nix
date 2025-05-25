{lib, ...}: {
  plugins = {
    hardtime = {
      enable = true;
      settings = {
        restricted_keys = {
          "+" = ["n" "x"];
          "-" = ["n" "x"];
          "<C-M>" = ["n" "x"];
          "<C-N>" = ["n" "x"];
          "<C-P>" = ["n" "x"];
          "<CR>" = ["n" "x"];
          gj = ["n" "x"];
          gk = ["n" "x"];
          h = lib.mkForce [];
          j = lib.mkForce [];
          k = lib.mkForce [];
          l = lib.mkForce [];
        };
      };
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>th";
            desc = "Toggle Hardtime";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>th";
      action = ":Hardtime toggle<CR>";
      options = {
        silent = true;
        desc = "Toggle Hardtime";
      };
    }
  ];
}
