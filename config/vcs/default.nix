{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./gitsigns {inherit inputs pkgs lib;})
  ];
}
