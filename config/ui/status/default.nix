{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./lualine {inherit inputs pkgs lib;})
  ];
}
