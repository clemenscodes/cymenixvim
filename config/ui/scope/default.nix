{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./winbar {inherit inputs pkgs lib;})
  ];
}
