{...}: {
  extraConfigLuaPost =
    /*
    lua
    */
    ''
      vim.notify = vim.schedule_wrap(require("notify"))
    '';
  plugins = {
    notify = {
      enable = true;
      settings = {
        timeout = 3000;
        top_down = true;
        max_height = 40;
        max_width = 300;
        minimum_width = 50;
        stages = "fade_in_slide_out";
        render = "minimal";
        level = "info";
        icons = {
          debug = "";
          error = "";
          info = "";
          trace = "✎";
          warn = "";
        };
      };
    };
  };
}
