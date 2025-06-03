{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./blink {inherit inputs pkgs lib;})
    (import ./cmp {inherit inputs pkgs lib;})
  ];
}
