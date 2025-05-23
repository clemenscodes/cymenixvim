{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./dressing {inherit inputs pkgs lib;})
  ];
}
