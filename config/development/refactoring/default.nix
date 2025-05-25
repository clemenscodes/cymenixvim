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
            __unkeyed-1 = "<leader>j";
            mode = "x";
            group = "+Refactor";
            icon = " ";
          }
          {
            __unkeyed-1 = "<leader>j";
            mode = "n";
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
      key = "<leader>je";
      action = "<cmd>Refactor extract<cr>";
      options = {
        desc = "Extract";
      };
    }
    {
      mode = "x";
      key = "<leader>jE";
      action = "<cmd>Refactor extract_to_file<cr>";
      options = {
        desc = "Extract to file";
      };
    }
    {
      mode = "x";
      key = "<leader>jv";
      action = "<cmd>Refactor extract_var<cr>";
      options = {
        desc = "Extract var";
      };
    }
    {
      mode = "n";
      key = "<leader>ji";
      action = "<cmd>Refactor inline_var<CR>";
      options = {
        desc = "Inline var";
      };
    }
    {
      mode = "n";
      key = "<leader>jI";
      action = "<cmd>Refactor inline_func<CR>";
      options = {
        desc = "Inline Func";
      };
    }
    {
      mode = "n";
      key = "<leader>jb";
      action = "<cmd>Refactor extract_block<CR>";
      options = {
        desc = "Extract block";
      };
    }
    {
      mode = "n";
      key = "<leader>jB";
      action = "<cmd>Refactor extract_block_to_file<CR>";
      options = {
        desc = "Extract block to file";
      };
    }
    {
      mode = "n";
      key = "<leader>jR";
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
