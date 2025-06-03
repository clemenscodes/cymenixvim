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
                vim.notify("Successfully initialized rust-analyzer")
              end
            '';
        };
      };
    };
  };
}
