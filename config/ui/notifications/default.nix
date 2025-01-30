{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./notify {inherit inputs pkgs lib;})
  ];
}
