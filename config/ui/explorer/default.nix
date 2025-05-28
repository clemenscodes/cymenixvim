{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./yazi {inherit inputs pkgs lib;})
  ];
}
