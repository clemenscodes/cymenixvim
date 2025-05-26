{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./buffers {inherit inputs pkgs lib;})
    (import ./diagnostics {inherit inputs pkgs lib;})
    (import ./ergonomics {inherit inputs pkgs lib;})
    (import ./navigation {inherit inputs pkgs lib;})
    (import ./organization {inherit inputs pkgs lib;})
    (import ./search {inherit inputs pkgs lib;})
    (import ./sessions {inherit inputs pkgs lib;})
    (import ./shortcuts {inherit inputs pkgs lib;})
    (import ./terminal {inherit inputs pkgs lib;})
  ];
  plugins = {
    snacks = {
      enable = true;

      settings = {
        picker = {
          actions = {
            calculate_file_truncate_width.__raw = ''
              function(self)
                  local width = self.list.win:size().width
                  self.opts.formatters.file.truncate = width - 6
              end
            '';
          };
          win = {
            list = {
              on_buf.__raw = ''
                function(self)
                    self:execute 'calculate_file_truncate_width'
                end
              '';
            };
            preview = {
              on_buf.__raw = ''
                function(self)
                    self:execute 'calculate_file_truncate_width'
                end
              '';
              on_close.__raw = ''
                function(self)
                    self:execute 'calculate_file_truncate_width'
                end
              '';
            };
          };
          layouts = {
            select = {
              layout = {
                relative = "cursor";
                width = 70;
                min_width = 0;
                row = 1;
              };
            };
          };
        };
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader><space>";
      action = ''<cmd>lua Snacks.picker.smart()<cr>'';
      options = {
        desc = "Smart Find Files";
      };
    }
    {
      mode = "n";
      key = "<leader>:";
      action = ''<cmd>lua Snacks.picker.command_history()<cr>'';
      options = {
        desc = "Command History";
      };
    }

    {
      mode = "n";
      key = "<leader>fa";
      action = ''<cmd>lua Snacks.picker.autocmds()<cr>'';
      options = {
        desc = "Find autocmds";
      };
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = ''<cmd>lua Snacks.picker.buffers()<cr>'';
      options = {
        desc = "Find buffers";
      };
    }
  ];
}
