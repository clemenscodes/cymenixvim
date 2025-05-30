{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./auto-session {inherit inputs pkgs lib;})
    (import ./persistence {inherit inputs pkgs lib;})
  ];
}
