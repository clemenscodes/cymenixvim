{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./autocommands {inherit inputs pkgs lib;})
    (import ./clipboard {inherit inputs pkgs lib;})
    (import ./diagnostic {inherit inputs pkgs lib;})
    (import ./editorconfig {inherit inputs pkgs lib;})
    (import ./filetypes {inherit inputs pkgs lib;})
    (import ./globals {inherit inputs pkgs lib;})
    (import ./keymaps {inherit inputs pkgs lib;})
    (import ./options {inherit inputs pkgs lib;})
    (import ./performance {inherit inputs pkgs lib;})
  ];
}
