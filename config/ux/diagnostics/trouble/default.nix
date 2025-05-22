{...}: {
  keymaps = [
    {
      action = ":Trouble diagnostics<CR>";
      key = "<leader>tt";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle trouble diagnostics";
      };
    }
  ];
  plugins = {
    trouble = {
      enable = true;
      settings = {
        auto_close = true;
        auto_jump = true;
        auto_preview = true;
        auto_refresh = true;
        focus = true;
        follow = true;
        indent_guides = true;
        multiline = true;
        open_no_results = false;
      };
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>tt";
            desc = "Toggle trouble diagnostics";
          }
        ];
      };
    };
  };
}
