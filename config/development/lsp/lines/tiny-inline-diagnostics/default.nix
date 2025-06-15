{lib, ...}: {config, ...}: {
  plugins = {
    tiny-inline-diagnostic = {
      enable = true;
      lazyLoad = {
        settings = lib.mkIf config.plugins.lz-n.enable {
          multilines = {
            enabled = true;
          };
          options = {
            use_icons_from_diagnostic = true;
          };
          break_line = {
            enabled = true;
          };
          preset = "classic";
          virt_texts = {
            priority = 2048;
          };
        };
      };
    };
  };
}
