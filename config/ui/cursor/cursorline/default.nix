{...}: {
  plugins = {
    cursorline = {
      enable = true;
      lazyLoad.settings.event = [
        "DeferredUIEnter"
      ];
      settings = {
        cursorline = {
          timeout = 0;
        };
        cursorword = {
          enable = false;
          hl = {
            underline = false;
          };
        };
      };
    };
  };
}
