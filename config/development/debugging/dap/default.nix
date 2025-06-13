{
  pkgs,
  lib,
  ...
}: {
  extraPlugins = [
    pkgs.vimPlugins.nvim-nio
    pkgs.vimPlugins.nvim-dap-vscode-js
  ];
  plugins = {
    dap-ui = {
      enable = true;
      settings = {
        controls = {
          element = "console";
        };
        layouts = [
          {
            elements = [
              {
                id = "scopes";
                size = 1;
              }
            ];
            position = "right";
            size = 100;
          }
          {
            elements = [
              {
                id = "console";
                size = 1;
              }
            ];
            position = "bottom";
            size = 25;
          }
        ];
      };
    };
    dap-virtual-text = {
      enable = true;
    };
    dap = {
      enable = true;
      adapters = {
        servers = {
          codelldb = let
            port = 13000;
          in {
            inherit port;
            host = "127.0.0.1";
            executable = {
              command = "${pkgs.vscode-extensions.vadimcn.vscode-lldb.adapter}/bin/codelldb";
              args = ["--port" "${builtins.toString port}"];
            };
          };
        };
      };
      configurations = let
        configForCpp = {
          type = "codelldb";
          request = "launch";
          name = "C++";
          program.__raw = ''
            function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end
          '';
          cwd = "\${workspaceFolder}";
          stdio = ["input.txt" "log.txt"];
          stopOnEntry = true;
        };
      in {
        rust = [];
        c = [configForCpp];
        cpp = [configForCpp];
        typescript = [
          {
            type = "pwa-node";
            request = "launch";
            name = "Launch file";
            program = "\${file}";
            cwd = "\${workspaceFolder}";
          }
          {
            type = "pwa-node";
            request = "attach";
            name = "Attach";
            processId.__raw = ''require ("dap.utils").pick_process'';
            cwd = "\${workspaceFolder}";
          }
          {
            type = "pwa-node";
            request = "attach";
            name = "Auto Attach";
            cwd.__raw = "vim.fn.getcwd()";
            protocol = "inspector";
            sourceMaps = true;
            resolveSourceMapLocations = [
              "\${workspaceFolder}/**"
              "!**/node_modules/**"
            ];
            restart = true;
          }
          {
            type = "pwa-node";
            request = "launch";
            name = "Debug Server (Production Build)";
            skipFiles = [
              "<node_internals>/**"
            ];
            program.__raw = "vim.fn.getcwd() .. '/build/server/index.js'";
            outFiles = [
              "\${workspaceFolder}/build/**/*.js"
            ];
            console = "integratedTerminal";
          }
          {
            type = "pwa-node";
            request = "launch";
            name = "Debug with Node Inspect";
            skipFiles = [
              "<node_internals>/**"
            ];
            runtimeExecutable = lib.getExe pkgs.nodejs_22;
            runtimeArgs = [
              "--inspect"
              "./build/server/index.js"
            ];
            console = "integratedTerminal";
            cwd = "\${workspaceFolder}";
            sourceMaps = true;
            resolveSourceMapLocations = [
              "\${workspaceFolder}/**"
              "!**/node_modules/**"
            ];
          }
          {
            type = "pwa-node";
            request = "launch";
            name = "Debug with Node Inspect (Break)";
            skipFiles = [
              "<node_internals>/**"
            ];
            runtimeExecutable = lib.getExe pkgs.nodejs_22;
            runtimeArgs = [
              "--inspect-brk"
              "./build/server/index.js"
            ];
            console = "integratedTerminal";
            cwd = "\${workspaceFolder}";
            sourceMaps = true;
            resolveSourceMapLocations = [
              "\${workspaceFolder}/**"
              "!**/node_modules/**"
            ];
          }
          {
            type = "pwa-node";
            request = "launch";
            name = "Debug Vite Dev Server";
            skipFiles = [
              "<node_internals>/**"
            ];
            runtimeExecutable = lib.getExe pkgs.nodejs_22;
            runtimeArgs = [
              "--inspect"
              "node_modules/vite/bin/vite.js"
              "--host"
            ];
            console = "integratedTerminal";
            cwd = "\${workspaceFolder}";
            sourceMaps = true;
            resolveSourceMapLocations = [
              "\${workspaceFolder}/**"
              "!**/node_modules/**"
            ];
          }
          {
            type = "pwa-node";
            request = "attach";
            name = "Attach to Process";
            port = 9229;
            restart = true;
            skipFiles = [
              "<node_internals>/**"
            ];
            sourceMaps = true;
            resolveSourceMapLocations = [
              "\${workspaceFolder}/**"
              "!**/node_modules/**"
            ];
            cwd = "\${workspaceFolder}";
          }
        ];
      };
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>d";
            group = "+Debug";
          }
          {
            __unkeyed-1 = "<leader>du";
            desc = "Toggle dapui";
          }
          {
            __unkeyed-1 = "<leader>dp";
            desc = "Toggle REPL";
          }
          {
            __unkeyed-1 = "<leader>db";
            desc = "Toggle breakpoint";
          }
          {
            __unkeyed-1 = "<leader>dc";
            desc = "Continue";
          }
          {
            __unkeyed-1 = "<leader>dk";
            desc = "Kill debugging session";
          }
          {
            __unkeyed-1 = "<leader>ds";
            group = "+Steps";
          }
          {
            __unkeyed-1 = "<leader>dsi";
            desc = "Step into function call";
          }
          {
            __unkeyed-1 = "<leader>dsu";
            desc = "Step out of function call";
          }
          {
            __unkeyed-1 = "<leader>dso";
            desc = "Step over function call";
          }
        ];
      };
    };
  };
  extraConfigLuaPost =
    /*
    lua
    */
    ''
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      vim.api.nvim_set_hl(0, "red", { fg = "#DD2E44" })
      vim.api.nvim_set_hl(0, "blue", { fg = "#3d59a1" })
      vim.api.nvim_set_hl(0, "green", { fg = "#9ece6a" })
      vim.api.nvim_set_hl(0, "yellow", { fg = "#FFFF00" })
      vim.api.nvim_set_hl(0, "orange", { fg = "#f09000" })
      vim.fn.sign_define('DapBreakpoint', { text='•', texthl='red', numhl='DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointCondition', { text='•', texthl='blue', numhl='DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointRejected', { text='•', texthl='orange', numhl='DapBreakpoint' })
      vim.fn.sign_define('DapStopped', { text='•', texthl='green', numhl='DapBreakpoint' })
      vim.fn.sign_define('DapLogPoint', { text='•', texthl='yellow', numhl='DapBreakpoint' })

      local dap = require("dap")
      local dap_vscode_js = require("dap-vscode-js")
      local languages = { "javascript" }

      dap_vscode_js.setup({
        debugger_path = "${pkgs.vscode-js-debug}",
        adapters = { 'pwa-node', 'node' }
      })

      dap.adapters['pwa-node'] = {
        type = 'server',
        host = 'localhost',
        port = "''${port}",
        executable = {
          command = '${pkgs.vscode-js-debug}/bin/js-debug',
          args = {
            "''${port}"
          },
        },
      }
    '';
  keymaps = [
    {
      action = ":DapToggleBreakpoint<CR>";
      key = "<leader>db";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle breakpoint";
      };
    }
    {
      action = ":lua require('dapui').open({reset = true})<CR>";
      key = "<leader>dr";
      mode = "n";
      options = {
        silent = true;
        desc = "Reset UI";
      };
    }
    {
      action = ":DapContinue<CR>";
      key = "<leader>dc";
      mode = "n";
      options = {
        silent = true;
        desc = "Continue";
      };
    }
    {
      action = ":DapTerminate<CR>";
      key = "<leader>dk";
      mode = "n";
      options = {
        silent = true;
        desc = "Kill debugging session";
      };
    }
    {
      action = ":DapStepInto<CR>";
      key = "<leader>dsi";
      mode = "n";
      options = {
        silent = true;
        desc = "Step into function call";
      };
    }
    {
      action = ":DapStepOut<CR>";
      key = "<leader>dsu";
      mode = "n";
      options = {
        silent = true;
        desc = "Step out of function call";
      };
    }
    {
      action = ":DapStepOver<CR>";
      key = "<leader>dso";
      mode = "n";
      options = {
        silent = true;
        desc = "Step over function call";
      };
    }
    {
      action = ":DapToggleRepl<CR>";
      key = "<leader>dp";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle REPL";
      };
    }
    {
      action = ":lua require('dapui').toggle()<CR>";
      key = "<leader>du";
      mode = "n";
      options = {
        silent = true;
        desc = "Toggle dapui";
      };
    }
  ];
}
