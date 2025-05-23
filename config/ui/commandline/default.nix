{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./fine-cmdline {inherit inputs pkgs lib;})
  ];
}
