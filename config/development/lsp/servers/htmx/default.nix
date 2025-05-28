{...}: {
  plugins = {
    lsp = {
      servers = {
        htmx = {
          enable = true;
          filetypes = ["html"];
        };
      };
    };
  };
}
