{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    (import ./dadbod {inherit inputs pkgs lib;})
  ];
}
