{...}: {
  plugins = {
    trouble = {
      enable = true;
      lazyLoad.settings.cmd = ["Trouble"];
      settings = {
        auto_close = true;
        auto_jump = true;
        auto_preview = true;
        auto_refresh = true;
        focus = true;
        follow = true;
        indent_guides = true;
        multiline = true;
        open_no_results = false;
      };
    };
  };
}
