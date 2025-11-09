{
  pkgs,
  lib,
  ...
}: {
  lsp = {
    servers = {
      nil_ls = {
        enable = true;
        config = {
          settings = {
            formatting = {
              command = ["${lib.getExe pkgs.nixfmt-rfc-style}"];
            };
            nix = {
              maxMemoryMB = 8192;
              flake = {
                autoArchive = true;
                autoEvalInputs = true;
              };
            };
          };
        };
      };
    };
  };
}
