{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./haskell-tools-nvim {inherit inputs pkgs lib;})
  ];
}
