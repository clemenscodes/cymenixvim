{...}: {
  plugins = {
    gitblame = {
      enable = true;
      settings = {};
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>tg";
            desc = "Toggle GitBlame";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      action = ":GitBlameToggle<CR>";
      key = "<leader>tg";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle Git Blame";
      };
    }
  ];
}
