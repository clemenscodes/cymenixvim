{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./haskell {inherit inputs pkgs lib;})
    (import ./java {inherit inputs pkgs lib;})
    (import ./kotlin {inherit inputs pkgs lib;})
    (import ./latex {inherit inputs pkgs lib;})
    (import ./rust {inherit inputs pkgs lib;})
  ];
}
