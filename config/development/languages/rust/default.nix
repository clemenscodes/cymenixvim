{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./crates-nvim {inherit inputs pkgs lib;})
    (import ./rustaceanvim {inherit inputs pkgs lib;})
    (import ./rustowl {inherit inputs pkgs lib;})
  ];
}
