{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./neodev {inherit inputs pkgs lib;})
    (import ./treesitter {inherit inputs pkgs lib;})
  ];
}
