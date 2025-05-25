{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [(import ./nx {inherit inputs pkgs lib;})];
}
