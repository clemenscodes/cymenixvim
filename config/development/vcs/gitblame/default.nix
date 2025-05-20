{...}: {
  plugins = {
    gitblame = {
      enable = true;
      settings = {
        enabled = true;
        delay = 2000;
        message_when_not_committed = "";
      };
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
