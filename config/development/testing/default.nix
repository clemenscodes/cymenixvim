{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./neotest {inherit inputs pkgs lib;})
  ];
}
