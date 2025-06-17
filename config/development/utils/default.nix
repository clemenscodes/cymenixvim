{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./aw-watcher {inherit inputs pkgs lib;})
    (import ./hex {inherit inputs pkgs lib;})
    (import ./treesitter {inherit inputs pkgs lib;})
  ];
}
