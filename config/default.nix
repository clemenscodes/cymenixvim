{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./core {inherit inputs pkgs lib;})
    (import ./development {inherit inputs pkgs lib;})
    (import ./ui {inherit inputs pkgs lib;})
    (import ./ux {inherit inputs pkgs lib;})
    (import ./vcs {inherit inputs pkgs lib;})
  ];
  package = pkgs.neovim;
  enableMan = true;
  vimAlias = false;
  viAlias = false;
  colorscheme = "catppuccin";
}
