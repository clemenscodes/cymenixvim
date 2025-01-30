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

  plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      nixGrammars = true;
    };
  };
}
