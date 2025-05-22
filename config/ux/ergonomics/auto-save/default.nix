{...}: {
  plugins = {
    auto-save = {
      enable = true;
      settings = {
        enabled = true;
        debounce_delay = 2000;
        lockmarks = true;
        noautocmd = true;
        writeAllBuffers = false;
        trigger_events = {
          cancel_deferred_save = ["InsertEnter"];
          defer_save = ["InsertLeave" "TextChanged"];
          immediate_save = ["BufLeave" "FocusLost" "QuitPre" "VimSuspend"];
        };
      };
    };
  };
}
