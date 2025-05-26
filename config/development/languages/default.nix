{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./java {inherit inputs pkgs lib;})
    (import ./rust {inherit inputs pkgs lib;})
  ];
}
