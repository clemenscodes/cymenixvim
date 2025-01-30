{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./trouble {inherit inputs pkgs lib;})
  ];
}
