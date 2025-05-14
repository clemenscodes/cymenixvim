{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./catppuccin {inherit inputs pkgs lib;})
    (import ./onedark {inherit inputs pkgs lib;})
  ];
}
