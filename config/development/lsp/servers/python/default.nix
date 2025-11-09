{pkgs, ...}: {config, ...}: {
  extraPackages = [pkgs.ruff];
  lsp = {
    servers = {
      pyright = {
        enable = true;
      };
    };
  };
}
