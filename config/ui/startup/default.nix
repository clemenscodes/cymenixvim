{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./alpha {inherit inputs pkgs lib;})
  ];
}
