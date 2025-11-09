{...}: {
  lsp = {
    servers = {
      htmx = {
        enable = true;
        config = {
          filetypes = ["html"];
        };
      };
    };
  };
}
