{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./lsp {inherit inputs pkgs lib;})
  ];
}
