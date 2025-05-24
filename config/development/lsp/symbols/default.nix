{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./symbol-usage {inherit inputs pkgs lib;})
  ];
}
