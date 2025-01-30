{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./bufferline {inherit inputs pkgs lib;})
  ];
}
