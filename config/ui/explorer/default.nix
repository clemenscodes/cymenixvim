{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./nvim-tree {inherit inputs pkgs lib;})
    (import ./yazi {inherit inputs pkgs lib;})
  ];
}
