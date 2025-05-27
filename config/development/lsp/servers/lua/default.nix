{...}: {
  plugins = {
    lazydev = {
      enable = true;
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
