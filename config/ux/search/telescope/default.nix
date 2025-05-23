{pkgs, ...}: {
  extraPackages = [
    pkgs.ripgrep
    pkgs.fd
  ];
  plugins = {
    telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
          settings = {
            caseMode = "smart_case";
            fuzzy = true;
          };
        };
        ui-select = {
          enable = true;
          settings = {
            __unkeyed-1 = {
              __raw = ''require("telescope.themes").get_dropdown{}'';
            };
          };
        };
      };
      highlightTheme = "Catppuccin Macchiato";
      settings = {
        defaults = {
          file_ignore_patterns = [
            "^.git/"
            "^output/"
            "^data/"
            "^node_modules/"
            "^build/"
            "^target/"
            "^dist/"
          ];
          set_env = {
            COLORTERM = "truecolor";
          };
        };
        pickers = {
          colorscheme = {
            enable_preview = true;
          };
        };
      };
    };
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>f";
            group = "+Telescope";
          }
          {
            __unkeyed-1 = "<leader>ff";
            desc = "Find files";
          }
          {
            __unkeyed-1 = "<leader>fg";
            desc = "Find words";
          }
          {
            __unkeyed-1 = "<leader>fp";
            desc = "Find projects";
          }
          {
            __unkeyed-1 = "<leader>fn";
            desc = "Find notifications";
          }
          {
            __unkeyed-1 = "gd";
            desc = "LSP go to definition";
          }
          {
            __unkeyed-1 = "gt";
            desc = "LSP go to type definition";
          }
          {
            __unkeyed-1 = "gi";
            desc = "LSP go to implementation";
          }
          {
            __unkeyed-1 = "gr";
            desc = "LSP references";
          }
          {
            __unkeyed-1 = "<leader>ds";
            desc = "LSP document symbols";
          }
          {
            __unkeyed-1 = "<leader>ws";
            desc = "LSP workspace symbols";
          }
          {
            __unkeyed-1 = "<leader>dws";
            desc = "LSP dynamic workspace symbols";
          }
          {
            __unkeyed-1 = "<leader>ic";
            desc = "LSP incoming calls";
          }
          {
            __unkeyed-1 = "<leader>oc";
            desc = "LSP outgoing calls";
          }
          {
            __unkeyed-1 = "<leader>dd";
            desc = "Diagnostics (all buffers)";
          }
          {
            __unkeyed-1 = "<leader>db";
            desc = "Diagnostics (current buffer)";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      action = ":Telescope find_files<CR>";
      key = "<leader>ff";
      mode = "n";
      options = {
        silent = true;
        desc = "Find files";
      };
    }
    {
      action = ":Telescope live_grep<CR>";
      key = "<leader>fg";
      mode = "n";
      options = {
        silent = true;
        desc = "Find words";
      };
    }
    {
      action = ":Telescope projects<CR>";
      key = "<leader>fp";
      mode = "n";
      options = {
        silent = true;
        desc = "Find projects";
      };
    }
    {
      mode = "n";
      key = "<leader>fn";
      action = "<cmd>Telescope noice<CR>";
      options = {
        silent = true;
        desc = "Find notifications";
      };
    }
    {
      mode = "n";
      key = "gd";
      action = {
        __raw = ''
          function()
            require('telescope.builtin').lsp_definitions()
          end
        '';
      };
      options = {
        silent = true;
        desc = "LSP go to definition";
      };
    }
    {
      mode = "n";
      key = "gt";
      action = {
        __raw = ''
          function()
            require('telescope.builtin').lsp_type_definitions()
          end
        '';
      };
      options = {
        silent = true;
        desc = "LSP go to type definition";
      };
    }
    {
      mode = "n";
      key = "gi";
      action = {
        __raw = ''
          function()
            require('telescope.builtin').lsp_implementations()
          end
        '';
      };
      options = {
        silent = true;
        desc = "LSP go to implementation";
      };
    }
    {
      mode = "n";
      key = "gr";
      action = {
        __raw = ''
          function()
            require('telescope.builtin').lsp_references()
          end
        '';
      };
      options = {
        silent = true;
        desc = "LSP references";
      };
    }
    {
      mode = "n";
      key = "<leader>ds";
      action = {
        __raw = ''
          function()
            require('telescope.builtin').lsp_document_symbols()
          end
        '';
      };
      options = {
        silent = true;
        desc = "LSP document symbols";
      };
    }
    {
      mode = "n";
      key = "<leader>ws";
      action = {
        __raw = ''
          function()
            require('telescope.builtin').lsp_workspace_symbols()
          end
        '';
      };
      options = {
        silent = true;
        desc = "LSP workspace symbols";
      };
    }
    {
      mode = "n";
      key = "<leader>dws";
      action = {
        __raw = ''
          function()
            require('telescope.builtin').lsp_dynamic_workspace_symbols()
          end
        '';
      };
      options = {
        silent = true;
        desc = "LSP dynamic workspace symbols";
      };
    }
    {
      mode = "n";
      key = "<leader>ic";
      action = {
        __raw = ''
          function()
            require('telescope.builtin').lsp_incoming_calls()
          end
        '';
      };
      options = {
        silent = true;
        desc = "LSP incoming calls";
      };
    }
    {
      mode = "n";
      key = "<leader>oc";
      action = {
        __raw = ''
          function()
            require('telescope.builtin').lsp_outgoing_calls()
          end
        '';
      };
      options = {
        silent = true;
        desc = "LSP outgoing calls";
      };
    }
    {
      mode = "n";
      key = "<leader>dd";
      action = {
        __raw = ''
          function()
            require('telescope.builtin').diagnostics()
          end
        '';
      };
      options = {
        silent = true;
        desc = "Diagnostics (all buffers)";
      };
    }
    {
      mode = "n";
      key = "<leader>db";
      action = {
        __raw = ''
          function()
            require('telescope.builtin').diagnostics({ bufnr = 0 })
          end
        '';
      };
      options = {
        silent = true;
        desc = "Diagnostics (current buffer)";
      };
    }
  ];
}
