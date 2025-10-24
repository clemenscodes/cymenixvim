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
  ];
  package = pkgs.neovim-unwrapped.overrideAttrs {
    lua = pkgs.lua.override {
      packageOverrides = final': prev': {
        neotest = prev'.neotest.overrideAttrs (oa: {
          doCheck = false;
        });
      };
    };
  };
  enableMan = true;
  vimAlias = false;
  viAlias = false;
  colorscheme = "catppuccin";
}
