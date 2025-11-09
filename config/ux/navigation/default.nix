{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./hardtime {inherit inputs pkgs lib;})
    (import ./precognition {inherit inputs pkgs lib;})
  ];
}
