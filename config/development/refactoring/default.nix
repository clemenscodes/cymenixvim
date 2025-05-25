{...}: {
  plugins = {
    refactoring = {
      enable = true;
      enableTelescope = true;
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>r";
            mode = "x";
            group = "+Refactor";
            icon = " ";
          }
          {
            __unkeyed-1 = "<leader>je";
            mode = "x";
            desc = "Extract";
          }
          {
            __unkeyed-1 = "<leader>jE";
            mode = "x";
            desc = "Extract to file";
          }
          {
            __unkeyed-1 = "<leader>jv";
            mode = "x";
            desc = "Extract var";
          }
          {
            __unkeyed-1 = "<leader>ji";
            mode = "n";
            desc = "Inline var";
          }
          {
            __unkeyed-1 = "<leader>jI";
            mode = "n";
            desc = "Inline Func";
          }
          {
            __unkeyed-1 = "<leader>jb";
            mode = "n";
            desc = "Extract block";
          }
          {
            __unkeyed-1 = "<leader>jB";
            mode = "n";
            desc = "Extract block to file";
          }
          {
            __unkeyed-1 = "<leader>jR";
            mode = "n";
            desc = "Refactoring";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      mode = "x";
      key = "<leader>re";
      action = "<cmd>Refactor extract<cr>";
      options = {
        desc = "Extract";
      };
    }
    {
      mode = "x";
      key = "<leader>rE";
      action = "<cmd>Refactor extract_to_file<cr>";
      options = {
        desc = "Extract to file";
      };
    }
    {
      mode = "x";
      key = "<leader>rv";
      action = "<cmd>Refactor extract_var<cr>";
      options = {
        desc = "Extract var";
      };
    }
    {
      mode = "n";
      key = "<leader>ri";
      action = "<cmd>Refactor inline_var<CR>";
      options = {
        desc = "Inline var";
      };
    }
    {
      mode = "n";
      key = "<leader>rI";
      action = "<cmd>Refactor inline_func<CR>";
      options = {
        desc = "Inline Func";
      };
    }
    {
      mode = "n";
      key = "<leader>rb";
      action = "<cmd>Refactor extract_block<CR>";
      options = {
        desc = "Extract block";
      };
    }
    {
      mode = "n";
      key = "<leader>rB";
      action = "<cmd>Refactor extract_block_to_file<CR>";
      options = {
        desc = "Extract block to file";
      };
    }
    {
      mode = "n";
      key = "<leader>fR";
      action.__raw = ''
        function()
          require('telescope').extensions.refactoring.refactors()
        end
      '';
      options = {
        desc = "Refactoring";
        silent = true;
      };
    }
  ];
}
