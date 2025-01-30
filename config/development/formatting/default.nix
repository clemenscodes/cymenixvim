{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./conform-nvim {inherit inputs pkgs lib;})
  ];
}
