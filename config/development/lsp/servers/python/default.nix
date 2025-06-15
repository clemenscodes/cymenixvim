{pkgs, ...}: {config, ...}: {
  extraPackages = [pkgs.ruff];
  plugins = {
    lsp = {
      servers = {
        pyright = {
          enable = true;
        };
      };
    };
  };
}
