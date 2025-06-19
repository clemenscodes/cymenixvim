{...}: {
  plugins = {
    lazydev = {
      enable = true;
      lazyLoad.settings.ft = [
        "lua"
      ];
      settings = {
        enabled = true;
      };
    };
    lsp = {
      servers = {
        lua_ls = {
          enable = true;
        };
      };
    };
  };
}
