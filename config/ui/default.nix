{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./commandline {inherit inputs pkgs lib;})
    (import ./cursor {inherit inputs pkgs lib;})
    (import ./explorer {inherit inputs pkgs lib;})
    (import ./icons {inherit inputs pkgs lib;})
    (import ./notifications {inherit inputs pkgs lib;})
    (import ./prompts {inherit inputs pkgs lib;})
    (import ./scope {inherit inputs pkgs lib;})
    (import ./search {inherit inputs pkgs lib;})
    (import ./startup {inherit inputs pkgs lib;})
    (import ./status {inherit inputs pkgs lib;})
    (import ./syntax {inherit inputs pkgs lib;})
    (import ./tabs {inherit inputs pkgs lib;})
    (import ./tags {inherit inputs pkgs lib;})
    (import ./theme {inherit inputs pkgs lib;})
  ];
}
