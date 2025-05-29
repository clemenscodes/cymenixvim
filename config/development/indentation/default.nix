{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./guess {inherit inputs pkgs lib;})
  ];
}
