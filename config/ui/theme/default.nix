{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./catppuccin {inherit inputs pkgs lib;})
  ];
}
