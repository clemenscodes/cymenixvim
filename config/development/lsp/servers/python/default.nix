{...}: {
  plugins = {
    lsp = {
      servers = {
        pyright = {
          enable = true;
          extraOptions = {};
        };
      };
    };
  };
}
