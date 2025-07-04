{...}: {
  plugins = {
    bufferline = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      settings = {
        options = {
          themable = true;
          colorIcons = true;
          showCloseIcon = true;
          showBufferIcons = true;
          showTabIndicators = true;
          alwaysShowBufferline = true;
          diagnostics = "nvim_lsp";
          mode = "buffers";
          separatorStyle = "thin";
          bufferCloseIcon = "";
          closeIcon = "";
          modifiedIcon = "●";
          leftTruncMarker = "";
          rightTruncMarker = "";
          indicator = {
            icon = "▎";
            style = "icon";
          };
          hover = {
            enabled = true;
          };
        };
        highlights = {
          fill = {
            bg = "#1E1F38";
          };
        };
      };
    };
  };
}
