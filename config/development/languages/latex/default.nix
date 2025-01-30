{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./vimtex {inherit inputs pkgs lib;})
  ];
}
