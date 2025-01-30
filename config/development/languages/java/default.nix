{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./nvim-jdtls {inherit inputs pkgs lib;})
  ];
}
