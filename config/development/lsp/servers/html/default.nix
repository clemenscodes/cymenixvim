{...}: {
  plugins = {
    lsp = {
      servers = {
        html = {
          enable = true;
          filetypes = [
            "typescript"
            "html"
            "typescriptreact"
            "typescript.tsx"
          ];
        };
      };
    };
  };
}
