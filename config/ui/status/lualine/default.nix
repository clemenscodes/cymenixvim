{...}: let
  cond.__raw = ''
    function()
      local cache = {}
      return function()
        local bufnr = vim.api.nvim_get_current_buf()
        if cache[bufnr] == nil then
          local buf_size = vim.api.nvim_buf_get_offset(bufnr, vim.api.nvim_buf_line_count(bufnr))
          cache[bufnr] = buf_size < 1024 * 1024 -- 1MB limit
          -- Clear cache on buffer unload
          vim.api.nvim_create_autocmd("BufUnload", {
            buffer = bufnr,
            callback = function() cache[bufnr] = nil end,
          })
        end
        return cache[bufnr]
      end
    end
  '';
in {
  plugins.lualine = {
    enable = true;

    settings = {
      options = {
        disabled_filetypes = {
          __unkeyed-2 = "neo-tree";
          __unkeyed-5 = "Avante";
          __unkeyed-6 = "AvanteInput";
          __unkeyed-7 = "trouble";
          __unkeyed-8 = "dapui_scopes";
          __unkeyed-9 = "dapui_breakpoints";
          __unkeyed-10 = "dapui_stacks";
          __unkeyed-11 = "dapui_watches";
          __unkeyed-12 = "dapui_console";
          __unkeyed-13 = "dashboard";
          __unkeyed-15 = "AvanteSelectedFiles";
          winbar = [
            "dap-repl"
            "dap-view"
            "dap-view-term"
            "neotest-summary"
          ];
        };

        globalstatus = true;
      };

      # +-------------------------------------------------+
      # | A | B | C                             X | Y | Z |
      # +-------------------------------------------------+
      sections = {
        lualine_a = ["mode"];
        lualine_b = ["branch"];
        lualine_c = [
          "filename"
          "diff"
        ];

        lualine_x = [
          {
            __unkeyed-1 = "diagnostics";
            # TODO: figure out how this works
            # It's triplicating number count
            # sources = [
            #   "nvim_lsp"
            #   "nvim_diagnostic"
            #   "nvim_workspace_diagnostic"
            # ];
            diagnostics_color = {
              error = {
                fg = "#ed8796";
              };
              warn = {
                fg = "#eed49f";
              };
              info = {
                fg = "#8aadf4";
              };
              hint = {
                fg = "#a6da95";
              };
            };
            colored = true;
          }

          {
            __unkeyed-1.__raw = ''
              function()
                  local msg = ""
                  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                  local clients = vim.lsp.get_active_clients()
                  if next(clients) == nil then
                      return msg
                  end
                  for _, client in ipairs(clients) do
                      local filetypes = client.config.filetypes
                      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                          return client.name
                      end
                  end
                  return msg
              end
            '';
            icon = "";
            color.fg = "#ffffff";
          }
          "encoding"
          "fileformat"
          "filetype"
        ];

        lualine_y = [
        ];

        lualine_z = [
          {
            __unkeyed-1 = "location";
            inherit cond;
          }
        ];
      };

      tabline = {
        lualine_a = [
          {
            __unkeyed-1 = "buffers";
            symbols = {
              alternate_file = "";
            };
          }
        ];
        lualine_z = ["tabs"];
      };

      winbar = {
        lualine_c = [
          {
            __unkeyed-1 = "navic";
            inherit cond;
            color_correction = "static";
            navic_opts = {
              highlight = true;
              depth_limit = 5;
              depth_limit_indicator = "...";
            };
          }
        ];

        lualine_x = [
          {
            __unkeyed-1 = "filename";
            newfile_status = true;
            path = 3;
            shorting_target = 150;
            symbols = {
              modified = "";
              readonly = "";
              newfile = "";
            };
          }
        ];
      };
    };
  };
}
