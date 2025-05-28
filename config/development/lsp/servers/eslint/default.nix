{...}: {
  plugins = {
    lsp = {
      servers = {
        eslint = {
          enable = true;
          settings = {
            root_dir = {
              __raw = ''vim.fn.getcwd()'';
            };
          };
        };
      };
    };
  };
}
