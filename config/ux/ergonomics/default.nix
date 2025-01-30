{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./auto-save {inherit inputs pkgs lib;})
    (import ./better-escape {inherit inputs pkgs lib;})
    (import ./nix-develop {inherit inputs pkgs lib;})
    (import ./nvim-autopairs {inherit inputs pkgs lib;})
    (import ./project-nvim {inherit inputs pkgs lib;})
    (import ./surround {inherit inputs pkgs lib;})
  ];
}
