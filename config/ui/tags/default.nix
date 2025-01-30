{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./tagbar {inherit inputs pkgs lib;})
  ];
}
