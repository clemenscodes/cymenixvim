{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./indent-blankline {inherit inputs pkgs lib;})
    (import ./colorizer {inherit inputs pkgs lib;})
    (import ./rainbow-delimiters {inherit inputs pkgs lib;})
  ];
}
