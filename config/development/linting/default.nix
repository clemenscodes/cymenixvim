{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./lint {inherit inputs pkgs lib;})
  ];
}
