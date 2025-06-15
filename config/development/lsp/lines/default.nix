{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./lsp_lines {inherit inputs pkgs lib;})
    (import ./tiny-inline-diagnostics {inherit inputs pkgs lib;})
  ];
}
