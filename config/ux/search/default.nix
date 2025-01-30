{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./telescope {inherit inputs pkgs lib;})
  ];
}
