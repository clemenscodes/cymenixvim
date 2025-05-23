{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./searchbox {inherit inputs pkgs lib;})
  ];
}
