{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [(import ./cmp {inherit inputs pkgs lib;})];
}
