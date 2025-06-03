{pkgs, ...}: {
  extraPackages = [pkgs.vscode-extensions.vadimcn.vscode-lldb.adapter];
  extraPlugins = [pkgs.vimPlugins.webapi-vim];
  plugins = {
    rustaceanvim = {
      enable = true;
      settings = {
        auto_focus = true;
        dap = {
          autoloadConfigurations = true;
        };
        server = {
          default_settings = {
            rust-analyzer = {
              cargo = {
                buildScripts = {
                  enable = true;
                };
                features = "all";
              };

              diagnostics = {
                enable = true;
                styleLints = {
                  enable = true;
                };
                disabled = [
                  "inactive-code"
                ];
              };

              checkOnSave = true;
              check = {
                command = "clippy";
                features = "all";
              };

              files = {
                excludeDirs = [
                  ".cargo"
                  ".direnv"
                  ".git"
                  "node_modules"
                  "target"
                ];
              };

              inlayHints = {
                bindingModeHints.enable = true;
                closureStyle = "rust_analyzer";
                closureReturnTypeHints.enable = "always";
                discriminantHints.enable = "always";
                expressionAdjustmentHints.enable = "always";
                implicitDrops.enable = true;
                lifetimeElisionHints.enable = "always";
                rangeExclusiveHints.enable = true;
              };

              procMacro = {
                enable = true;
              };

              rustc.source = "discover";
            };
          };
        };
        tools = {
          enable_clippy = true;
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
