{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./toggleterm {inherit inputs pkgs lib;})
  ];
}
