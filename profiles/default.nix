{
  inputs,
  pkgs,
  lib,
  ...
}: {
  default = {...}: {
    imports = [
      (import ../config {inherit inputs pkgs lib;})
    ];
  };
  development = {...}: {
    imports = [
      (import ../config {inherit inputs pkgs lib;})
      (import ../config/development/languages {inherit inputs pkgs lib;})
      (import ../config/development/testing {inherit inputs pkgs lib;})
      (import ../config/development/debugging {inherit inputs pkgs lib;})
      (import ../config/development/linting {inherit inputs pkgs lib;})
      (import ../config/development/vcs {inherit inputs pkgs lib;})
    ];
  };
  cardano = {...}: {
    imports = [
      (import ../config {inherit inputs pkgs lib;})
      (import ../config/development/languages {inherit inputs pkgs lib;})
      (import ../config/development/testing {inherit inputs pkgs lib;})
      (import ../config/development/debugging {inherit inputs pkgs lib;})
      (import ../config/development/linting {inherit inputs pkgs lib;})
      (import ../config/development/vcs {inherit inputs pkgs lib;})
      (import ../config/development/lsp/servers/aiken {inherit inputs pkgs lib;})
    ];
  };
}
