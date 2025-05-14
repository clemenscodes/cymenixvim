{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./ts-autotag {inherit inputs pkgs lib;})
    (import ./ts-context-commentstring {inherit inputs pkgs lib;})
  ];
  extraPackages = with pkgs; [tree-sitter nodejs_22 gcc];
  plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      nixGrammars = true;
    };
  };
}
