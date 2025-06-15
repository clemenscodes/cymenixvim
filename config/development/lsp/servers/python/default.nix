{...}: {config, ...}: {
  plugins = {
    lsp = {
      servers = {
        pyright = {
          enable = true;
        };
      };
    };
  };
}
