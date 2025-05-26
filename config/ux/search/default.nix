{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./devdocs {inherit inputs pkgs lib;})
    (import ./telescope {inherit inputs pkgs lib;})
  ];
}
