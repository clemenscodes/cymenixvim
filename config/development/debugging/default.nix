{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./dap {inherit inputs pkgs lib;})
  ];
}
