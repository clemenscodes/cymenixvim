{...}: {
  plugins = {
    lsp = {
      servers = {
        yamlls = {
          enable = true;
          extraOptions = {};
        };
      };
    };
  };
}
