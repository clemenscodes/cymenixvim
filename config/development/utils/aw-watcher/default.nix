{pkgs, ...}: {
  plugins = {
    aw-watcher = {
      enable = true;
      settings = {
        host = "127.0.0.1";
        port = 5600;
        pulsetime = 1;
      };
    };
  };
}
