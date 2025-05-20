{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.auto-session];
  extraConfigLuaPost = ''
    local nvim_tree_api = require('nvim-tree.api')
    local function close_nvim_tree()
      require('nvim-tree.view').close()
    end
    local function open_nvim_tree()
      nvim_tree_api.tree.open()
    end
    local function close_all_floating_wins()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local config = vim.api.nvim_win_get_config(win)
        if config.relative ~= "" then
          vim.api.nvim_win_close(win, false)
        end
      end
    end
    require("auto-session").setup {
      log_level = "error",
      git_use_branch_name = true,
      git_auto_restore_on_branch_change = true,
      pre_save_cmds = {close_nvim_tree, close_all_floating_wins},
      post_open_cmds = {open_nvim_tree},
      post_save_cmds = {open_nvim_tree},
      post_restore_cmds = {open_nvim_tree},
      post_cwd_changed_cmds = {
        function()
          require("lualine").refresh()
        end
      },
      args_allow_single_directory = true,
      bypass_save_filetypes = { 'alpha', 'dashboard' },
      auto_create = function()
        local cmd = 'git rev-parse --is-inside-work-tree'
        return vim.fn.system(cmd) == 'true\n'
      end,
      auto_restore_last_session = vim.loop.cwd() == vim.loop.os_homedir(),
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
