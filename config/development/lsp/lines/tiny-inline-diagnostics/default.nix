{lib, ...}: {config, ...}: {
  plugins = {
    tiny-inline-diagnostic = {
      enable = true;
      lazyLoad = lib.mkIf config.plugins.lz-n.enable  {
        settings = {
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
