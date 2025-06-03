{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [(import ./markdown {inherit inputs pkgs lib;})];
}
