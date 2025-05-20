{...}: {
  plugins = {
    auto-session = {
      enable = true;
      settings = {
        enabled = true;
        allowed_dirs = ["~/.local/src"];
        auto_create = true;
        auto_restore = true;
        auto_restore_last_session = true;
        auto_save = true;
        bypass_save_filetypes = ["alpha"];
        cwd_change_handling = true;
        use_git_branch = true;
        session_lens = {
          load_on_setup = true;
          previewer = true;
        };
      };
    };
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
            __unkeyed-1 = "<leader>as";
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
