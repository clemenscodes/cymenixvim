{pkgs, ...}: let
  nxls = "${import ./nxls.nix {inherit pkgs;}}";
in {
  plugins = {
    lsp = {
      servers = {
        nxls = {
          enable = true;
          package = nxls;
          cmd = ["${nxls}/bin/nxls" "--stdio"];
          filetypes = ["json" "jsonc"];
          rootMarkers = [".git" "nx.json"];
        };
      };
    };
  };
}
