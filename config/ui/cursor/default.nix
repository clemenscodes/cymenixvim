{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./cursorline {inherit inputs pkgs lib;})
  ];
}
