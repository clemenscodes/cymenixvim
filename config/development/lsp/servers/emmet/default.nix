{...}: {
  lsp = {
    servers = {
      emmet_ls = {
        enable = true;
        config = {
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
