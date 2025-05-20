{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./avante {inherit inputs pkgs lib;})
    (import ./cmp {inherit inputs pkgs lib;})
  ];
}
