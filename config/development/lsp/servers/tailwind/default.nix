{...}: {
  lsp = {
    servers = {
      tailwindcss = {
        enable = true;
        config = {
          filetypes = ["html" "typescript"];
        };
      };
    };
  };
}
