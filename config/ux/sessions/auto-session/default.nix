{pkgs, ...}: {
  extraPlugins = [pkgs.vimPlugins.auto-session];
  extraConfigLuaPost = ''
    local function get_breakpoints_path()
      local Lib = require('auto-session.lib')
      local session_dir = require('auto-session').get_root_dir()
      local session_name = Lib.current_session_name()
      local bp_path = session_dir .. Lib.escape_session_name(session_name) .. '.json'
      return bp_path
    end

    local function open_file(fpath, mode)
      local fp = io.open(fpath, mode)
      assert(fp, "Couldn't open file " .. fpath)
      return fp
    end

    local function get_buffer_number(fpath)
      local bufnr = vim.fn.bufnr(fpath, true)
      -- Load the file if it wasn't loaded by the session
      if vim.fn.bufloaded(bufnr) == 0 then
        vim.api.nvim_buf_call(bufnr, vim.cmd.edit)
      end
      return bufnr
    end

    local function save_session_breakpoints()
      local savepath = get_breakpoints_path()
      local Breakpoints = require('dap.breakpoints')
      local breakpoints_by_buf = Breakpoints.get()

      if vim.tbl_isempty(breakpoints_by_buf)  then
        if vim.fn.filereadable(savepath) > 0 then
          vim.fn.delete(savepath)
        end
        return nil
      end

      local breakpoints_by_file = {}
      for buf, buf_bps in pairs(breakpoints_by_buf) do
        local fname = vim.api.nvim_buf_get_name(buf)
        breakpoints_by_file[fname] = buf_bps
      end

      local fp = open_file(savepath, 'w')
      fp:write(vim.fn.json_encode(breakpoints_by_file))
      fp:close()
      vim.notify("Saved breakpoints: " .. savepath)
    end

    local function restore_session_breakpoints()
      local bp_path = get_breakpoints_path()
      if vim.fn.filereadable(bp_path) == 0 then
        return nil
      end
      local fp = open_file(bp_path, 'r')
      local content = fp:read('*a')
      local breakpoints_by_file = vim.fn.json_decode(content)
      fp:close()

      local Breakpoints = require('dap.breakpoints')
      for fname, breakpoints in pairs(breakpoints_by_file) do
        local bufnr = get_buffer_number(fname)
        for _, bp in pairs(breakpoints) do
          local line = bp.line
          local opts = {
            condition = bp.condition,
            log_message = bp.logMessage,
            hit_condition = bp.hitCondition
          }
          Breakpoints.set(opts, bufnr, line)
        end
      end
    end

    local function delete_session_breakpoints()
      local bp_path = get_breakpoints_path()
      vim.fn.delete(bp_path)
    end

    local function open()
      if vim.api.nvim_buf_get_name(0):match("COMMIT_EDITMSG") then
        require('snacks').bufdelete.delete()
      end
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
      enabled = true,
      auto_restore = true,
      auto_save = true,
      auto_restore_last_session = vim.loop.cwd() == vim.loop.os_homedir(),
      args_allow_single_directory = true,
      args_allow_files_auto_save = false,
      bypass_save_filetypes = { 'alpha', 'dashboard' },
      git_use_branch_name = true,
      git_auto_restore_on_branch_change = true,
      auto_create = function()
        local cmd = 'git rev-parse --is-inside-work-tree'
        return vim.fn.system(cmd) == 'true\n'
      end,
      pre_save_cmds = {close_nvim_tree, close_all_floating_wins},
      pre_delete_cmds = {delete_session_breakpoints},
      post_save_cmds = {save_session_breakpoints},
      post_open_cmds = {open},
      post_restore_cmds = {open, restore_session_breakpoints},
      post_cwd_changed_cmds = {},
    }
  '';
  plugins = {
    which-key = {
      settings = {
        spec = [
          {
            __unkeyed-1 = "<leader>c";
            group = "Sessions";
          }
          {
            __unkeyed-1 = "<leader>cr";
            desc = "Restore session";
          }
          {
            __unkeyed-r = "<leader>cl";
            desc = "Search session";
          }
          {
            __unkeyed-1 = "<leader>cd";
            desc = "Delete session";
          }
          {
            __unkeyed-1 = "<leader>cs";
            desc = "Save session";
          }
        ];
      };
    };
  };
  keymaps = [
    {
      action = ":SessionRestore<CR>";
      key = "<leader>cr";
      mode = "n";
      options = {
        silent = true;
        desc = "Restore session";
      };
    }
    {
      action = ":Autosession search<CR>";
      key = "<leader>cl";
      mode = "n";
      options = {
        silent = true;
        desc = "Search session";
      };
    }
    {
      action = ":Autosession delete<CR>";
      key = "<leader>cd";
      mode = "n";
      options = {
        silent = true;
        desc = "Delete session";
      };
    }
    {
      action = ":SessionSave<CR>";
      key = "<leader>cs";
      mode = "n";
      options = {
        silent = true;
        desc = "Save session";
      };
    }
  ];
}
