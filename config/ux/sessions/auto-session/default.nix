{...}: {
  extraPlugins = [pkgs.vimPlugins.auto-session];
  extraConfigLuaPost = ''
    local function close_nvim_tree()
      require('nvim-tree.view').close()
    end
    local function open_nvim_tree()
      require('nvim-tree.api').tree.open()
    end
    require("auto-session").setup {
      log_level = "error",
      git_use_branch_name = true,
      git_auto_restore_on_branch_change = true,
      pre_save_cmds = {close_nvim_tree},
      post_save_cmds = {open_nvim_tree},
      post_open_cmds = {open_nvim_tree},
      post_restore_cmds = {open_nvim_tree},
      bypass_save_filetypes = { 'alpha', 'dashboard' },
      cwd_change_handling =  true,
      pre_cwd_changed_cmds = {close_nvim_tree},
      post_cwd_changed_cmds = {
        open_nvim_tree,
        function()
          require("lualine").refresh() -- example refreshing the lualine status line _after_ the cwd changes
        end
      },
    }
    require('lualine').setup{
      sections = {
        lualine_c = {
          function()
            return require('auto-session.lib').current_session_name(true)
          end
        }
      }
    }
  '';
  plugins = {
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>a";
            group = "AutoSession";
          }
          {
            __unkeyed-1 = "<leader>ar";
            desc = "Restore session";
          }
          {
            __unkeyed-1 = "<leader>as";
            desc = "Search session";
          }
          {
            __unkeyed-1 = "<leader>ad";
            desc = "Delete session";
          }
          {
            __unkeyed-1 = "<leader>av";
            desc = "Save session";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      action = ":SessionRestore<CR>";
      key = "<leader>ar";
      mode = "n";
      options = {
        silent = true;
        desc = "Restore session";
      };
    }
    {
      action = ":Autosession search<CR>";
      key = "<leader>as";
      mode = "n";
      options = {
        silent = true;
        desc = "Search session";
      };
    }
    {
      action = ":Autosession delete<CR>";
      key = "<leader>ad";
      mode = "n";
      options = {
        silent = true;
        desc = "Delete session";
      };
    }
    {
      action = ":SessionSave<CR>";
      key = "<leader>av";
      mode = "n";
      options = {
        silent = true;
        desc = "Save session";
      };
    }
  ];
}
