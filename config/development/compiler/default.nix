{...}: {
  plugins = {
    compiler = {
      enable = true;
      settings = {};
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>b";
            icon = "";
            group = "+Build";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>bo";
      action = "<cmd>CompilerOpen<CR>";
      options = {
        desc = "Compiler Open";
      };
    }
    {
      mode = "n";
      key = "<leader>br";
      action = "<cmd>CompilerRedo<CR>";
      options = {
        desc = "Compiler Redo";
      };
    }
    {
      mode = "n";
      key = "<leader>bs";
      action = "<cmd>CompilerStop<CR>";
      options = {
        desc = "Compiler Stop";
      };
    }
    {
      mode = "n";
      key = "<leader>bt";
      action = "<cmd>CompilerToggleResults<CR>";
      options = {
        desc = "Compiler Toggle Results";
      };
    }
  ];
}
