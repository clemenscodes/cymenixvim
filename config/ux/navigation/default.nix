{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./hardtime {inherit inputs pkgs lib;})
    (import ./leap {inherit inputs pkgs lib;})
    (import ./tmux-navigator {inherit inputs pkgs lib;})
  ];
}
