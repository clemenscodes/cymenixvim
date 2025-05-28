{...}: {
  plugins = {
    lsp = {
      servers = {
        emmet_ls = {
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
