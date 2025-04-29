{...}: {
  plugins = {
    lsp = {
      servers = {
        tailwindcss = {
          enable = true;
          filetypes = [
            "typescript"
            "html"
            "typescriptreact"
            "typescript.tsx"
          ];
          extraOptions = {
            rootDir =
              /*
              lua
              */
              ''
                require('lspconfig').util.root_pattern(".git")
              '';
          };
        };
      };
    };
  };
}
