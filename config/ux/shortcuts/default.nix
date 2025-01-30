{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./which-key {inherit inputs pkgs lib;})
  ];
}
