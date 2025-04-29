{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./rust {inherit inputs pkgs lib;})
  ];
}
