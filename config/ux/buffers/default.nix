{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./vim-bbye {inherit inputs pkgs lib;})
  ];
}
