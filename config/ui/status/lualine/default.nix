{...}: {
  plugins = {
    lualine = {
      enable = true;

      lazyLoad.settings.event = [
        "VimEnter"
        "BufReadPost"
        "BufNewFile"
      ];

      settings = {
        options = {
          globalstatus = true;
        };
      };
    };
  };
}
