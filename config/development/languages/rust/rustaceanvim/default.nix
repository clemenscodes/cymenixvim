{pkgs, ...}: {
  extraPackages = [pkgs.vscode-extensions.vadimcn.vscode-lldb.adapter];
  plugins = {
    rustaceanvim = {
      enable = true;
      settings = {
        auto_focus = true;
        dap = {
          autoloadConfigurations = true;
        };
        tools = {
          executor = "toggleterm";
          onInitialized =
            /*
            lua
            */
            ''
              function()
                vim.notify("successfully initialized rust-analyzer")
              end
            '';
        };
      };
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>fr";
            group = "+Rust";
          }
          {
            __unkeyed-1 = "<leader>frr";
            desc = "Find rust runnables";
          }
          {
            __unkeyed-1 = "<leader>frt";
            desc = "Find rust testables";
          }
          {
            __unkeyed-1 = "<leader>frd";
            desc = "Find rust debuggables";
          }
          {
            __unkeyed-1 = "<leader>fra";
            desc = "Run last rust test";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      action = ":RustLsp runnables<CR>";
      key = "<leader>frr";
      mode = "n";
      options = {
        desc = "Find rust runnables";
        silent = true;
      };
    }
    {
      action = ":RustLsp testables<CR>";
      key = "<leader>frt";
      mode = "n";
      options = {
        desc = "Find rust testables";
        silent = true;
      };
    }
    {
      action = ":RustLsp debuggables<CR>";
      key = "<leader>frd";
      mode = "n";
      options = {
        desc = "Find rust debuggables";
        silent = true;
      };
    }
    {
      action = ":RustLsp testables last<CR>";
      key = "<leader>fra";
      mode = "n";
      options = {
        desc = "Run last rust test";
        silent = true;
      };
    }
  ];
}
