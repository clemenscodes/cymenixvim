{...}: {
  plugins = {
    noice = {
      enable = true;
      settings = {
        cmdline = {
          enabled = true;
        };
        messages = {
          enabled = true;
        };
        popupmenu = {
          enabled = true;
        };
        commands = {
          enabled = true;
        };
        notify = {
          enabled = true;
        };
        lsp = {
          override = {
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
            "vim.lsp.util.stylize_markdown" = true;
            "cmp.entry.get_documentation" = true;
          };
          progress = {
            enabled = true;
          };
          signature = {
            enabled = true;
          };
          hover = {
            enabled = true;
            silent = true;
          };
          documentation = {
            enabled = true;
          };
        };
        routes = [
          {
            filter = {
              event = "msg_show";
              kind = "search_count";
            };
            opts = {
              skip = true;
            };
          }
          {
            filter = {find = "No information available";};
            opts = {skip = true;};
          }
          {
            filter = {
              event = "lsp";
              kind = "progress";
              cond = {
                __raw = ''
                  function(message)
                    local client = vim.tbl_get(message.opts, 'progress', 'client')
                    local servers = { 'jdtls' }

                    for index, value in ipairs(servers) do
                        if value == client then
                            return true
                        end
                    end
                  end
                '';
              };
            };
            opts = {
              skip = true;
            };
          }
        ];
      };
    };
  };
}
