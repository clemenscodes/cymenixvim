{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./gitblame {inherit inputs pkgs lib;})
    (import ./gitsigns {inherit inputs pkgs lib;})
    (import ./lazygit {inherit inputs pkgs lib;})
  ];
}
