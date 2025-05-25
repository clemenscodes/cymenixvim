{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.hardtime-nvim];
  extraConfigLuaPost = ''
    require('hardtime').setup({
      restricted_keys = {
        ['j'] = {},
        ['k'] = {},
      },
    })
  '';
  plugins = {
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
