{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./compiler {inherit inputs pkgs lib;})
    (import ./completion {inherit inputs pkgs lib;})
    (import ./debugging {inherit inputs pkgs lib;})
    (import ./formatting {inherit inputs pkgs lib;})
    (import ./indentation {inherit inputs pkgs lib;})
    (import ./languages {inherit inputs pkgs lib;})
    (import ./lsp {inherit inputs pkgs lib;})
    (import ./linting {inherit inputs pkgs lib;})
    (import ./refactoring {inherit inputs pkgs lib;})
    (import ./snippets {inherit inputs pkgs lib;})
    (import ./testing {inherit inputs pkgs lib;})
    (import ./utils {inherit inputs pkgs lib;})
    (import ./vcs {inherit inputs pkgs lib;})
  ];
}
