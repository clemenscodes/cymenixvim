{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./auto-session {inherit inputs pkgs lib;})
  ];
}
