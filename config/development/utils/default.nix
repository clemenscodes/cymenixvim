{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./aw-watcher {inherit inputs pkgs lib;})
    (import ./neodev {inherit inputs pkgs lib;})
    (import ./treesitter {inherit inputs pkgs lib;})
  ];
}
