{pkgs, ...}: {
  plugins = {
    lsp = {
      servers = {
        angularls = {
          enable = true;
        };
      };
    };
  };
}
