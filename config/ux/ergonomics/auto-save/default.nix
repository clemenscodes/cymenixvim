{...}: {
  plugins = {
    auto-save = {
      enable = true;
      settings = {
        enabled = true;
        debounce_delay = 5000;
        lockmarks = true;
        noautocmd = true;
        writeAllBuffers = false;
        trigger_events = {
          cancel_deferred_save = ["InsertEnter"];
          defer_save = ["BufLeave" "FocusLost"];
          immediate_save = [];
        };
      };
    };
  };
}
